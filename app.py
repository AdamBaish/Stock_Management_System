"""
app.py
"""
from flask import Flask
from flask import render_template
from flask import request, url_for

import psycopg2

from werkzeug.utils import redirect


app = Flask(__name__)


"""Functions to query tables"""
def get_account_list(accountType):
    """Query data from either the customer, employee or manager tables"""
    conn = psycopg2.connect("dbname=stockmanagementsystem user=postgres password=Password")    #connects to the database (Username/Password will need to be changed according to what you setup)
    cur = conn.cursor()
    cur.execute(f"SELECT * FROM {accountType}")    #executues query
    print(f"The number of users in {accountType}_table:  {cur.rowcount}")
    row = cur.fetchone()
    accountList=[]

    while row is not None:
        accountList.append(row)    #appends either the customer, employee or manager into a list
        row = cur.fetchone()

    cur.close()
    return accountList

def read_account(id, account ):
    """Read single account data by id from account database table"""
    conn = psycopg2.connect("dbname=stockmanagementsystem user=postgres password=Password")    #connects to the database (Username/Password will need to be changed according to what you setup)
    cur = conn.cursor()

    cur.execute (f"SELECT * FROM {account}_table WHERE {account}_id::text ='{id}'")
    account_info = cur.fetchall()

    cur.execute (f"SELECT fk_store_id FROM store_{account}_link WHERE fk_{account}_id::text ='{id}'")
    store_link = cur.fetchall()
    print(f"Store link {store_link}")
    account_info = account_info + store_link

    cur.execute (f"SELECT fk_username FROM login_{account}_link WHERE fk_{account}_id::text ='{id}'")
    login_link = cur.fetchall()
    print(f"Store link {login_link}")
    account_info = account_info + login_link
    cur.close()
    print(f" Account details : {account_info}")
    return account_info

def insert_account(letter_id, account_details, account):
    """Insert single account data in database table"""
    conn = psycopg2.connect("dbname=stockmanagementsystem user=postgres password=Password")    #connects to the database (Username/Password will need to be changed according to what you setup)
    cur = conn.cursor()
    # Get max. index from table
    cur.execute(f"SELECT {account}_id FROM {account}_table WHERE {account}_id=( SELECT max({account}_id) FROM {account}_table)")
    max_index = cur.fetchall()
    max_index = max_index[0][0]
    user_index = int(max_index[-2:]) + 1
    print(f" user count {user_index}")
    print(f" Insert function {account_details}")

    if user_index < 10 :
        cur.execute(f"INSERT INTO {account}_table VALUES ('{letter_id}0{user_index}', '{account_details[0][1]}', '{account_details[0][2]}');")
        cur.execute(f"INSERT INTO login_{account}_link VALUES ('{account_details[2][0]}', '{letter_id}0{user_index}');")
        cur.execute(f"INSERT INTO store_{account}_link VALUES ('{account_details[1][0]}', '{letter_id}0{user_index}');")
    else :
        cur.execute(f"INSERT INTO {account}_table VALUES ('{letter_id}{user_index}', '{account_details[0][1]}', '{account_details[0][2]}');")
        cur.execute(f"INSERT INTO login_{account}_link VALUES ('{account_details[2][0]}', '{letter_id}{user_index}');")
        cur.execute(f"INSERT INTO store_{account}_link VALUES ('{account_details[1][0]}', '{letter_id}{user_index}');")
        print(f" Elements more than 10")

    conn.commit()
    cur.close()
    return "OK", 200

def delete_account(delete_id, account):
    """Delete single user account data from database table"""
    conn = psycopg2.connect("dbname=stockmanagementsystem user=postgres password=Password")    #connects to the database (Username/Password will need to be changed according to what you setup)
    cur = conn.cursor()
    print(f"Ready to delete {delete_id} from table {account}")
    cur.execute(f"DELETE FROM store_{account}_link WHERE fk_{account}_id::text= '{delete_id}'")
    conn.commit()
    cur.execute(f"DELETE FROM login_{account}_link WHERE fk_{account}_id::text= '{delete_id}'")
    conn.commit()
    if (account == 'manager') or (account =='employee'):
        try :
            cur.execute(f"DELETE FROM employee_manager_link WHERE fk_{account}_id::text= '{delete_id}'")
            conn.commit()
        except:
            print("No row in employee_manager_link table.")
    cur.execute(f"DELETE FROM login_{account}_link WHERE fk_{account}_id::text= '{delete_id}'")
    conn.commit()
    cur.execute(f"DELETE FROM {account}_table WHERE {account}_id::text= '{delete_id}'")
    conn.commit()
    cur.close()
    return "OK", 200

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

def get_items_from_search(search, store):
    """Query data from the store table"""
    search = " '" + search + "';"
    store = " '" + store + "' "
    print(search + store)
    conn = psycopg2.connect("dbname=stockmanagementsystem user=postgres password=Password")    #connects to the database (Username/Password will need to be changed according to what you setup)
    cur = conn.cursor()
    query = "SELECT product_name, product_price, product_quantity FROM store_table, product_table, store_product_link WHERE store_product_link.fk_store_id = store_table.store_id AND product_table.product_id = store_product_link.fk_product_id AND product_name =" + search
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


def get_items_by_store(store):
    """Query data from the store table"""
    #Match the store name to the store ID's
    store_list=["Bournemouth", "London", "Manchester", "Bristol", "York"]
    store_ids=["STR01", "STR02", "STR03", "STR04", "STR05"]
    index = store_list.index(store)
    id = store_ids[index]

    conn = psycopg2.connect("dbname=stockmanagementsystem user=postgres password=Password")    #connects to the database (Username/Password will need to be changed according to what you setup)
    cur = conn.cursor()
    query = "SELECT product_name FROM product_table, location_table, store_table, store_product_link, store_location_link WHERE product_table.product_id = store_product_link.fk_product_id AND store_table.store_id = store_product_link.fk_store_id AND store_id IN ('"+ id +"') AND location_table.location_id = store_location_link.fk_location_id AND location_area IN ('"+ store +"')"
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

@app.route('/')
def home_page():
    store_names = get_stores_names()    #returns the list of store names that get passed into Homepage.html
    return render_template("Homepage.html", store_names=store_names, login="False")


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
        store_names = get_stores_names()    #returns the list of store names that get passed into Homepage.html
        return render_template("Homepage.html", store_names=store_names,login="Success")
    else:    #for GET requests
        return render_template("Login.html", error="none")


@app.route('/Manage_Users')
def manage_users():
    """Send users data to front-end"""
    print(f" Manage Users page loaded ")
    users_list = get_account_list("manager_table") + get_account_list("employee_table") + get_account_list("customer_table")
    return render_template("Manage_Users.html", users = users_list)

# Function to update user role. Id letters for account type : M - manager, E - employee, C- customer

@app.route('/api/manage_users/', methods=['PUT'])
def updateUserRole():
    user_data = request.get_json()
    id = user_data["id"]
    new_role = user_data["newrole"]
    if "M" in id :
        old_role = "manager"
    elif "E" in id :
        old_role = "employee"
    else :
        old_role = "customer"
    # Select first letter for new account id
    if new_role == "manager" :
        letter_id = 'M'
    elif new_role == "employee" :
        letter_id = 'E'
    else :
        letter_id = 'C'

    print(f"Data received {id}, {old_role}")
    info = read_account(id, old_role)
    print(f" Data read from db : {info}")
    insert_account(letter_id, info, new_role)
    delete_account(id, old_role)
    return "OK",200

@app.route('/item_search')
def item_search():
    store = request.args.get('store')
    products = get_items_by_store(store)
    print(products)
    return render_template("item_search.html", products=products)


@app.route('/search_results')
def search_results():
    #Retreives the variables from the URL
    search = request.args.get('search')
    store = request.args.get('store')
    #Calls the search function
    items = get_items_from_search(search, store)
    print (items)
    return render_template("search_results.html",items=items)


if __name__ == '__main__':
    app.run()