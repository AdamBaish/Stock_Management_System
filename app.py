"""
app.py
"""
from re import L
from flask import Flask
from flask import render_template
from flask import jsonify
from flask import request, url_for

import psycopg2
from werkzeug.utils import redirect


app = Flask(__name__)


"""Functions to query tables"""
def get_employees():
    """Query data from the employee table"""
    conn = psycopg2.connect("dbname=stockmanagementsystem user=postgres password=Password")    #connects to the database (Username/Password will need to be changed according to what you setup)
    cur = conn.cursor()
    cur.execute("SELECT * FROM employee_table")    #executues query 
    print("The number of parts: ", cur.rowcount)
    row = cur.fetchone()
    employees=[]

    while row is not None:
        employees.append(row)    #appends the employees into a list
        row = cur.fetchone()

    cur.close()
    print (employees)
    return employees


def get_login_details():
    """Query data from the login table"""
    conn = psycopg2.connect("dbname=stockmanagementsystem user=postgres password=Password")    #connects to the database (Username/Password will need to be changed according to what you setup)
    cur = conn.cursor()
    cur.execute("SELECT * FROM login_table")    #executues query 
    print("The number of parts: ", cur.rowcount)
    row = cur.fetchone()
    login_detials_lt=[]

    while row is not None:
        login_detials_lt.append(row)    #appends the login details into a list
        row = cur.fetchone()

    cur.close()
    print ("login_detials requested")
    login_detials = [item for t in login_detials_lt for item in t]    #list comprehension to put the data in a more usable format
    return login_detials


def get_permissons(username):
    """Query data from the login table"""
    conn = psycopg2.connect("dbname=stockmanagementsystem user=postgres password=Password")    #connects to the database (Username/Password will need to be changed according to what you setup)
    cur = conn.cursor()
    cur.execute("SELECT " +username+" FROM login_employee_link, login_customer_link, login_manager_link")    #executues query 
    print("The number of parts: ", cur.rowcount)
    row = cur.fetchone()
    permission=[]

    while row is not None:
        permission.append(row)    #appends the login details into a list
        row = cur.fetchone()

    cur.close()
    print ("permission requested")
    #login_detials = [item for t in login_detials_lt for item in t]    #list comprehension to put the data in a more usable format
    return permission


def get_stores_names():
    """Query data from the store table"""
    conn = psycopg2.connect("dbname=stockmanagementsystem user=postgres password=Password")    #connects to the database (Username/Password will need to be changed according to what you setup)
    cur = conn.cursor()
    cur.execute("SELECT location_area FROM location_table")    #executues query 
    print("The number of parts: ", cur.rowcount)
    row = cur.fetchone()
    store_names_lt=[]

    while row is not None:
        store_names_lt.append(row)    #appends the stores into a list
        row = cur.fetchone()

    cur.close()
    store_names = [item for t in store_names_lt for item in t]    #list comprehension to put the data in a more usable format
    return store_names
store_names = get_stores_names()


def get_items(search, store):
    """Query data from the store table"""
    search = " '" + search + "';"
    store = " '" + store + "' "
    print(search + store)
    conn = psycopg2.connect("dbname=stockmanagementsystem user=postgres password=Password")    #connects to the database (Username/Password will need to be changed according to what you setup)
    cur = conn.cursor()
    query = "SELECT product_name, product_price, product_quantity FROM store_table, product_table, store_product_link WHERE store_product_link.fk_store_id = store_table.store_id AND product_table.product_id = store_product_link.fk_product_id AND product_name =" + search
    print (query)
    cur.execute(query)    #executues query 
    print("The number of parts: ", cur.rowcount)
    row = cur.fetchone()
    products=[]

    while row is not None:
        products.append(row)    #appends the stores into a list
        row = cur.fetchone()

    cur.close()
    products = [item for t in products for item in t]    #list comprehension to put the data in a more usable format
    return products


@app.route('/')
def home_page():
    store_names = get_stores_names()    #returns the list of store names that get passed into Homepage.html
    return render_template("Homepage.html", store_names=store_names)


@app.route('/login', methods=['GET','POST'])
def login():
    if request.method == "POST":
        login_detials = get_login_details()    #calls function to return username and password

        #retreive username and password from webpage
        username = request.form['username']
        password = request.form['password']
        error="none"
        try:
            #finds the index of username, and the corrisponding password 
            username_index = login_detials.index(username)
            stored_password = login_detials[username_index+1]
            #checks password
            if stored_password == password:
                print("Success")
            else:
                return render_template("Login.html", error="error")    #the username is correct but the password is not
        except ValueError:
            return render_template("Login.html", error="error")    #username is not in the database


        #redirect user to new page
        return redirect(url_for("home_page"))
    else:    #for GET requests
        return render_template("Login.html", error="none")


@app.route('/Manage_Users')
def manage_users():
    return render_template("Manage_Users.html")


@app.route('/item_search')
def item_search():
    return render_template("item_search.html")


@app.route('/search_results')
def search_results():
    search = request.args.get('search')
    store = request.args.get('store')
    items = get_items(search, store)
    print (items)
    return render_template("search_results.html",items=items)


if __name__ == '__main__':
    app.run()
