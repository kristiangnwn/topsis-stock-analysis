from flask import Flask, render_template, request, redirect, url_for, flash
from flask_login import LoginManager, login_user, logout_user, current_user, login_required
from database import mysql, User, UserLog
from datetime import datetime, date, timedelta
from werkzeug.security import generate_password_hash, check_password_hash
import pandas as pd
import numpy as np
import logging
import io
import sys
import re
import time
import random
import json
from alpha_vantage.timeseries import TimeSeries
from io import StringIO
import os
from dotenv import load_dotenv

# Load environment variables
load_dotenv()

app = Flask(__name__)
app.config['SECRET_KEY'] = os.getenv('SECRET_KEY')
app.config['MYSQL_HOST'] = os.getenv('MYSQL_HOST')
app.config['MYSQL_USER'] = os.getenv('MYSQL_USER')
app.config['MYSQL_PASSWORD'] = os.getenv('MYSQL_PASSWORD')
app.config['MYSQL_DB'] = os.getenv('MYSQL_DB')

mysql.init_app(app)
login_manager = LoginManager()
login_manager.init_app(app)

@login_manager.user_loader
def load_user(user_id):
    cursor = mysql.connection.cursor()
    cursor.execute("SELECT * FROM users WHERE id = %s", (user_id,))
    user_data = cursor.fetchone()
    if user_data:
        user = User(*user_data)
        return user
    return None

@app.before_request
def log_user_activity():
    if current_user.is_authenticated:
        endpoint = request.endpoint
        if endpoint != 'static':
            log_activity = UserLog(current_user.id, f"Accessed {endpoint}", datetime.utcnow())
            cursor = mysql.connection.cursor()
            cursor.execute("INSERT INTO user_logs (user_id, activity, timestamp) VALUES (%s, %s, %s)", (log_activity.user_id, log_activity.activity, log_activity.timestamp))
            mysql.connection.commit()
            cursor.close()

def is_valid_email(email):
    # Cek apakah format email valid
    email_regex = r'^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$'
    return re.match(email_regex, email)

def is_valid_password(password):
    # Kata sandi minimal 8 karakter, mengandung huruf besar, kecil, dan angka
    if len(password) < 8:
        return "Kata sandi harus minimal 8 karakter."
    if not re.search(r'[A-Z]', password):
        return "Kata sandi harus mengandung setidaknya satu huruf besar."
    if not re.search(r'[a-z]', password):
        return "Kata sandi harus mengandung setidaknya satu huruf kecil."
    if not re.search(r'[0-9]', password):
        return "Kata sandi harus mengandung setidaknya satu angka."
    return None

@app.route('/register', methods=['GET', 'POST'])
def register():
    if request.method == 'POST':
        username = request.form['username']
        email = request.form['email']
        password = request.form['password']

        # Validasi email
        if not is_valid_email(email):
            flash("Email tidak valid.", 'danger')
            return redirect(url_for('register'))
        
        # Validasi kata sandi
        password_error = is_valid_password(password)
        if password_error:
            flash(password_error, 'danger')
            return redirect(url_for('register'))

        cursor = mysql.connection.cursor()
        cursor.execute("SELECT * FROM users WHERE username = %s OR email = %s", (username, email))
        existing_user = cursor.fetchone()
        cursor.close()

        if existing_user:
            flash('Username or email already exists.', 'danger')
            return redirect(url_for('register'))
        
        password_hash = generate_password_hash(password)
        cursor = mysql.connection.cursor()
        cursor.execute("INSERT INTO users (username, email, password_hash) VALUES (%s, %s, %s)", 
                      (username, email, password_hash))
        mysql.connection.commit()
        cursor.close()

        flash('Registration successful!', 'success')
        return redirect(url_for('login'))

    return render_template('register.html')

@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']

        cursor = mysql.connection.cursor()
        cursor.execute("SELECT * FROM users WHERE username = %s", (username,))
        user_data = cursor.fetchone()
        cursor.close()

        if user_data:
            user = User(*user_data)
            if check_password_hash(user.password_hash, password):
                login_user(user)
                flash('Login successful!', 'success')
                return redirect(url_for('home'))
            else:
                flash('Invalid password.', 'danger')
        else:
            flash('Username not found.', 'danger')

    return render_template('login.html')

@app.route('/logout')
@login_required
def logout():
    logout_user()
    flash('You have been logged out.', 'success')
    return redirect(url_for('home'))

# Konfigurasi logging
logging.basicConfig(level=logging.DEBUG)

ALPHA_VANTAGE_API_KEY = os.getenv('ALPHA_VANTAGE_API_KEY')

def collect_data(tickers_list, start_date, end_date):
    logging.debug(f"Mulai pengumpulan data Alpha Vantage untuk tickers: {tickers_list}, tanggal {start_date} sampai {end_date}")
    
    ts = TimeSeries(key=ALPHA_VANTAGE_API_KEY, output_format='pandas')
    all_data = {}
    
    for ticker in tickers_list:
        try:
            logging.debug(f"Mengambil data untuk ticker: {ticker}")
            data, meta_data = ts.get_daily(symbol=ticker, outputsize='compact')
            
            # Ambil kolom Close
            series = data['4. close']
            series.index = pd.to_datetime(series.index)
            
            # Filter tanggal user
            mask = (series.index >= pd.to_datetime(start_date)) & (series.index <= pd.to_datetime(end_date))
            filtered_series = series[mask]
            
            if filtered_series.empty:
                logging.warning(f"Data untuk {ticker} kosong setelah filter tanggal. Skip.")
                continue
            
            all_data[ticker] = filtered_series
            
            # Delay aman 12 detik
            time.sleep(random.uniform(12, 15))
        
        except Exception as e:
            logging.error(f"Error saat mengambil data {ticker}: {e}")
            continue

    if not all_data:
        logging.error("Semua ticker gagal diambil. Data kosong total.")
        return None

    data_df = pd.DataFrame(all_data)
    logging.debug(f"Tickers valid yang berhasil diambil: {list(all_data.keys())}")
    logging.debug(f"Data head: \n{data_df.head()}")

    return data_df

def preprocess_data(data):
    data = data.dropna()
    normalized_data = (data - data.min()) / (data.max() - data.min())
    return normalized_data

def topsis(data, risk_profile='Balanced'):
    print("Langkah 1: Normalisasi Data")
    normalized_data = (data - data.min()) / (data.max() - data.min())
    print(normalized_data.head())

    print("\nLangkah 2: Hitung Bobot berdasarkan Profil Risiko")
    num_tickers = normalized_data.shape[1]

    if risk_profile == 'High Risk High Reward':
        volatility_weights = data.std() / data.std().sum()
        weights = volatility_weights.values
        print("Profil Risiko: High Risk (Bobot Volatilitas)")
    elif risk_profile == 'Low Risk Low Reward':
        stability_weights = (1 / data.std()) / (1 / data.std()).sum()
        weights = stability_weights.values
        print("Profil Risiko: Low Risk (Bobot Stabilitas)")
    else:  # Balanced
        weights = np.array([1 / num_tickers] * num_tickers)
        print("Profil Risiko: Balanced (Bobot Equal)")

    print("Bobot yang digunakan:", weights)

    print("\nLangkah 3: Hitung Matriks Ternormalisasi Tertimbang")
    weighted_matrix = normalized_data * weights
    print(weighted_matrix.head())

    print("\nLangkah 4: Solusi Ideal Positif dan Negatif")
    positive_ideal = weighted_matrix.max()
    negative_ideal = weighted_matrix.min()
    print("Solusi Ideal Positif:", positive_ideal)
    print("Solusi Ideal Negatif:", negative_ideal)

    print("\nLangkah 5: Hitung Jarak ke Solusi Ideal")
    positive_distance = np.sqrt(((weighted_matrix - positive_ideal) ** 2).sum(axis=0))
    negative_distance = np.sqrt(((weighted_matrix - negative_ideal) ** 2).sum(axis=0))
    print("Jarak ke Positif:", positive_distance)
    print("Jarak ke Negatif:", negative_distance)

    print("\nLangkah 6: Hitung Nilai Preferensi")
    preference_values = negative_distance / (positive_distance + negative_distance)
    print("Nilai Preferensi:", preference_values)

    print("\nLangkah 7: Urutkan Hasil")
    sorted_indices = preference_values.argsort()[::-1]
    sorted_tickers = data.columns[sorted_indices]
    sorted_preferences = preference_values.iloc[sorted_indices]

    result = pd.DataFrame({
        'Ticker': sorted_tickers,
        'Preference Value': sorted_preferences,
        'Risk Profile': risk_profile
    })

    print("\nHasil Akhir TOPSIS:")
    print(result)

    return result

def perform_analysis(tickers, start_date, end_date, risk_profile='Balanced', print_output=False):
    tickers_list = tickers.split(',')

    output = io.StringIO()
    sys.stdout = output  # Arahkan print ke output log

    print("Tahap 1: Pengumpulan Data")
    data = collect_data(tickers_list, start_date, end_date)
    if data is None or data.empty:
        return {
            'error': 'Failed to collect data.'
        }
    print("Data Mentah yang Diperoleh:")
    print(data.head())

    print("\nTahap 2: Preproses (Normalisasi Data)")
    preprocessed_data = (data - data.min()) / (data.max() - data.min())
    print(preprocessed_data.head())

    print("\nTahap 3: Analisis Metode TOPSIS")
    result = topsis(data, risk_profile)
    print(result.head())

    if result is None or result.empty:
        return {
            'error': 'TOPSIS analysis failed or returned no results.'
        }

    output_str = output.getvalue()
    sys.stdout = sys.__stdout__  # Kembalikan stdout

    return {
        'data': data.reset_index().to_dict('records'),  # Raw data
        'preprocessed_data': preprocessed_data.reset_index().to_dict('records'),  # Normalisasi
        'result': result.to_dict('records'),  # Ranking preferensi
        'output': output_str  # Log print untuk /output
    }

# Rute untuk halaman utama
@app.route('/')
def home():
    return render_template('home.html')

@app.route('/analysis', methods=['GET', 'POST'])
@login_required
def analysis():
    if request.method == 'POST':
        tickers = request.form.get('tickers')
        start_date = request.form.get('start_date')
        end_date = request.form.get('end_date')
        risk_profile = request.form.get('risk_profile', 'Balanced')

        if not tickers:
            flash('Harap masukkan tickers yang valid.', 'danger')
            return redirect(url_for('analysis'))

        try:
            start_dt = datetime.strptime(start_date, "%Y-%m-%d").date()
            end_dt = datetime.strptime(end_date, "%Y-%m-%d").date()
            today = date.today()

            if start_dt > today or end_dt > today:
                flash('Tanggal tidak valid.', 'danger')
                return redirect(url_for('analysis'))

            if start_dt > end_dt:
                flash('Tanggal mulai harus lebih awal.', 'danger')
                return redirect(url_for('analysis'))

            days_limit = 100
            oldest_allowed = today - timedelta(days=days_limit)
            if start_dt < oldest_allowed:
                flash(f'Data maksimal 100 hari terakhir (mulai {oldest_allowed.isoformat()})', 'danger')
                return redirect(url_for('analysis'))

        except ValueError:
            flash('Format tanggal tidak valid.', 'danger')
            return redirect(url_for('analysis'))

        analysis_results = perform_analysis(tickers, start_date, end_date, risk_profile, print_output=True)

        if 'error' in analysis_results:
            flash(analysis_results['error'], 'danger')
            return redirect(url_for('analysis'))

        cursor = mysql.connection.cursor()
        query = """
        INSERT INTO analysis_results 
        (user_id, tickers, start_date, end_date, risk_profile, result, log_output, raw_data, preprocessed_data)
        VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s)
        """

        for record in analysis_results['data']:
            record['date'] = record['date'].isoformat()

        for record in analysis_results['preprocessed_data']:
            record['date'] = record['date'].isoformat()

        values = (
            current_user.id, tickers, start_date, end_date, risk_profile,
            json.dumps(analysis_results['result']),  # simpan hasil ranking sebagai JSON
            analysis_results['output'],
            json.dumps(analysis_results['data']),  # simpan dataframe mentah sebagai JSON
            json.dumps(analysis_results['preprocessed_data'])  # simpan preprocessed data sebagai JSON
        )
        cursor.execute(query, values)
        mysql.connection.commit()
        cursor.close()

        return redirect(url_for('recommendation'))

    return render_template('analysis.html',
        max_date=date.today().isoformat(),
        min_date=(date.today() - timedelta(days=100)).isoformat())

@app.route('/recommendation', methods=['GET'])
@login_required
def recommendation():
    cursor = mysql.connection.cursor()
    query = """
    SELECT tickers, start_date, end_date, risk_profile, result, raw_data
    FROM analysis_results
    WHERE user_id = %s
    ORDER BY id DESC
    LIMIT 1
    """
    cursor.execute(query, (current_user.id,))
    result = cursor.fetchone()
    cursor.close()

    price_trends = {}

    if result:
        tickers, start_date, end_date, risk_profile, result_str, raw_data_str = result
        result_data = json.loads(result_str)
        result_df = pd.DataFrame(result_data)

        raw_data_df = pd.DataFrame(json.loads(raw_data_str))
        raw_data_df['date'] = pd.to_datetime(raw_data_df['date'])

        for ticker in result_df['Ticker']:
            try:
                series = raw_data_df[['date', ticker]].dropna().tail(7)
                price_trends[ticker] = {
                    'dates': series['date'].tolist(),
                    'prices': series[ticker].tolist()
                }
            except Exception as e:
                logging.error(f"Gagal buat chart mini untuk {ticker}: {e}")
                price_trends[ticker] = {
                    'dates': [],
                    'prices': []
                }

    else:
        result_df = None
        risk_profile = 'Tidak diketahui'

    return render_template(
        'recommendation.html',
        recommendations=result_df,
        price_trends=price_trends,
        risk_profile=risk_profile 
    )

@app.route('/output', methods=['GET'])
@login_required
def output():
    cursor = mysql.connection.cursor()
    query = """
    SELECT result, log_output
    FROM analysis_results
    WHERE user_id = %s
    ORDER BY id DESC
    LIMIT 1
    """
    cursor.execute(query, (current_user.id,))
    result = cursor.fetchone()
    cursor.close()

    if result:
        result_str, log_output = result
        result_data = json.loads(result_str)
        result_df = pd.DataFrame(result_data)

        # Siapkan data chart: { labels: [...], data: [...] }
        chart_labels = result_df['Ticker'].tolist()
        chart_values = result_df['Preference Value'].tolist()

    else:
        log_output = 'Tidak ada hasil analisis tersedia.'
        chart_labels = []
        chart_values = []

    return render_template(
        'output.html',
        output=log_output,
        chart_labels=chart_labels,  # Kirim label
        chart_values=chart_values   # Kirim data
    )


@app.route('/about')
def about():
    return render_template('about.html')

@app.route('/setting', methods=['GET', 'POST'])
@login_required
def setting():
    if request.method == 'POST':
        try:
            # Retrieve form data
            new_email = request.form.get('email', '').strip()
            current_password = request.form.get('current_password', '').strip()
            new_password = request.form.get('new_password', '').strip()
            confirm_password = request.form.get('confirm_password', '').strip()
            email_notifications = 'email_notifications' in request.form

            cursor = mysql.connection.cursor()

            if not is_valid_email(new_email):
                flash('Email tidak valid.', 'danger')
                return redirect(url_for('setting'))

            cursor.execute("""
                SELECT * FROM users 
                WHERE email = %s AND id != %s
            """, (new_email, current_user.id))
            existing_email = cursor.fetchone()
            
            if existing_email:
                flash('Email sudah digunakan oleh pengguna lain.', 'danger')
                cursor.close()
                return redirect(url_for('setting'))

            cursor.execute("""
                UPDATE users 
                SET email = %s, email_notifications = %s 
                WHERE id = %s
            """, (new_email, email_notifications, current_user.id))

            if current_password or new_password or confirm_password:
                # Validate current password
                if not check_password_hash(current_user.password_hash, current_password):
                    flash('Kata sandi saat ini salah.', 'danger')
                    cursor.close()
                    return redirect(url_for('setting'))

                if new_password:
                    password_error = is_valid_password(new_password)
                    if password_error:
                        flash(password_error, 'danger')
                        cursor.close()
                        return redirect(url_for('setting'))

                    if new_password != confirm_password:
                        flash('Konfirmasi kata sandi tidak cocok.', 'danger')
                        cursor.close()
                        return redirect(url_for('setting'))

                    new_password_hash = generate_password_hash(new_password)
                    cursor.execute("""
                        UPDATE users 
                        SET password_hash = %s 
                        WHERE id = %s
                    """, (new_password_hash, current_user.id))

            mysql.connection.commit()
            cursor.close()

            log_activity = UserLog(current_user.id, "Updated account settings", datetime.utcnow())
            cursor = mysql.connection.cursor()
            cursor.execute("""
                INSERT INTO user_logs (user_id, activity, timestamp) 
                VALUES (%s, %s, %s)
            """, (log_activity.user_id, log_activity.activity, log_activity.timestamp))
            mysql.connection.commit()
            cursor.close()

            flash('Pengaturan akun berhasil diperbarui.', 'success')
            return redirect(url_for('setting'))

        except Exception as e:
            logging.error(f"Error in settings update: {e}")
            flash('Terjadi kesalahan saat memperbarui pengaturan.', 'danger')
            return redirect(url_for('setting'))

    return render_template('setting.html')

if __name__ == '__main__':
    app.run(debug=True)
