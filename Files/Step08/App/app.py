#!/bin/python
# -*- coding: latin-1 -*-
from flask import Flask, request, jsonify

app = Flask(__name__)

@app.route('/shanks/red', methods=['POST'])
def process_key():
    data = request.get_json()
    key = data.get('key')

    #if key and isinstance(key, str) and len(key) == 32:
    if key == "24b7ca3c8facfb39793ad82e595c6a13":
        return jsonify({'encoded_message_64': 'Q3JlYXRlIGEgZmlsZSBuYW1lZCAnZXhfMDgudHh0JyBpbiB0aGUgJy90bXAnIGRpcmVjdG9yeSBhbmQgYWRkIHRoZSB0ZXh0ICdTaGFua3MnLgo='}), 200
    else:
        return jsonify({'error': 'Invalid key.'}), 400

if __name__ == '__main__':
    #app.run(debug=True)
    app.run(host='0.0.0.0', port=8090)
