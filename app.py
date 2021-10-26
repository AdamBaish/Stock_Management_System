from flask import Flask
from flask import render_template

app = Flask(__name__)


@app.route('/')
def home_page():
    return render_template("Homepage.html")


@app.route('/login')
def login():
    return render_template("Login.html")


@app.route('/Manage_Users')
def manage_users():
    return render_template("Manage_Users.html")


@app.route('/item_search')
def item_search():
    return render_template("item_search.html")


if __name__ == '__main__':
    app.run()
