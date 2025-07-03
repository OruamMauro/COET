import os
import requests
from flask import Flask, render_template, request

app = Flask(__name__)

@app.errorhandler(500)
def internal_error(error):
    return render_template('500.html'), 500

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/fetch_data', methods=['POST'])
def fetch_data():
    api_url = 'https://reqres.in/api/users/3'
    response = requests.get(api_url, timeout=(3, None))
    
    if response.status_code == 200:
        output_dir = '/tmp/REST'
        if not os.path.exists(output_dir):
            os.makedirs(output_dir)
        
        output_file = os.path.join(output_dir, 'user_3.txt')
        with open(output_file, 'w') as f:
            f.write(response.text)
        #return f"Data fetched successfully and saved."
        return render_template('ok.html')
    else:
        return "Failed to fetch data from the API."

if __name__ == '__main__':
    #app.run(debug=True)
    app.run(host='0.0.0.0', port=5000, debug=False)