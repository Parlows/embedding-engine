from flask import Flask, request
import json

app = Flask(__name__)

from encoders.text_encoders import CLIPEncoder

@app.route('/text', methods=['GET'])
def get_text():
    clip = CLIPEncoder()
    text = request.args.get('text')
    emb = clip.get_text_embedding(text)

    return emb.tolist()
