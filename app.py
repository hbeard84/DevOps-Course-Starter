from flask import Flask, render_template, request, redirect, url_for
import session_items as session
import requests
from flask_config import Config

app = Flask(__name__)
app.config.from_object('flask_config.Config')

@app.route('/')
def index():
    response=requests.get(f"https://api.trello.com/1/boards/{Config.TRELLO_BOARD_ID}/cards?key={Config.TRELLO_API_KEY}&token={Config.TRELLO_API_SECRET}")
    cards=response.json()
    return render_template("index.html", todos = cards)


@app.route('/add-todo', methods=["POST"])
def add_todo():
    item = request.form.get('name')

    session.add_item(item)

    return redirect("/")



if __name__ == '__main__':
    app.run()
