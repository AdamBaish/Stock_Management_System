CREATE TABLE store_table
(
	store_id VARCHAR(8),
	store_name VARCHAR(20),
	CONSTRAINT store_id_pk PRIMARY KEY (store_id)
);

CREATE TABLE product_table
(
	product_id VARCHAR(8),
	product_name VARCHAR(50),
	product_price NUMERIC(3,0),
	product_quantity NUMERIC(3),
	CONSTRAINT product_id_pk PRIMARY KEY (product_id)
);

CREATE TABLE location_table
(
	location_id VARCHAR(8),
	location_area VARCHAR(30),
	location_address VARCHAR(50),
	location_postcode VARCHAR(10),
	CONSTRAINT location_id_pk PRIMARY KEY (location_id)
);

CREATE TABLE login_table
(
	username VARCHAR(50),
	password VARCHAR(20),
	CONSTRAINT username_pk PRIMARY KEY (username)
);

CREATE TABLE customer_table
(
	customer_id VARCHAR(8),
	customer_firstName VARCHAR(20),
	customer_lastName VARCHAR(20),
	CONSTRAINT customer_id_pk PRIMARY KEY (customer_id)
);

CREATE TABLE employee_table
(
	employee_id VARCHAR(8),
	employee_firstName VARCHAR(20),
	employee_lastName VARCHAR(20),
	CONSTRAINT employee_id_pk PRIMARY KEY (employee_id)
);

CREATE TABLE manager_table
(
	manager_id VARCHAR(8),
	manager_firstName VARCHAR(20),
	manager_lastName VARCHAR(20),
	CONSTRAINT manager_id_pk PRIMARY KEY (manager_id)
);

CREATE TABLE store_product_link
(
	fk_store_id VARCHAR(8),
	fk_product_id VARCHAR(8),
	PRIMARY KEY (fk_store_id, fk_product_id),
	FOREIGN KEY (fk_store_id) REFERENCES store_table(store_id),
	FOREIGN KEY (fk_product_id) REFERENCES product_table(product_id)
);

CREATE TABLE store_location_link
(
	fk_store_id VARCHAR(8),
	fk_location_id VARCHAR(8),
	PRIMARY KEY (fk_store_id, fk_location_id),
	FOREIGN KEY (fk_store_id) REFERENCES store_table(store_id),
	FOREIGN KEY (fk_location_id) REFERENCES location_table(location_id)
);

CREATE TABLE store_customer_link
(
	fk_store_id VARCHAR(8),
	fk_customer_id VARCHAR(8),
	PRIMARY KEY (fk_store_id, fk_customer_id),
	FOREIGN KEY (fk_store_id) REFERENCES store_table(store_id),
	FOREIGN KEY (fk_customer_id) REFERENCES customer_table(customer_id)
);

CREATE TABLE store_employee_link
(
	fk_store_id VARCHAR(8),
	fk_employee_id VARCHAR(8),
	PRIMARY KEY (fk_store_id, fk_employee_id),
	FOREIGN KEY (fk_store_id) REFERENCES store_table(store_id),
	FOREIGN KEY (fk_employee_id) REFERENCES employee_table(employee_id)
);

CREATE TABLE store_manager_link
(
	fk_store_id VARCHAR(8),
	fk_manager_id VARCHAR(8),
	PRIMARY KEY (fk_store_id, fk_manager_id),
	FOREIGN KEY (fk_store_id) REFERENCES store_table(store_id),
	FOREIGN KEY (fk_manager_id) REFERENCES manager_table(manager_id)
);

CREATE TABLE login_manager_link
(
	fk_username VARCHAR(50),
	fk_manager_id VARCHAR(8),
	PRIMARY KEY (fk_username, fk_manager_id),
	FOREIGN KEY (fk_username) REFERENCES login_table(username),
	FOREIGN KEY (fk_manager_id) REFERENCES manager_table(manager_id)
);

CREATE TABLE login_employee_link
(
	fk_username VARCHAR(50),
	fk_employee_id VARCHAR(8),
	PRIMARY KEY (fk_username, fk_employee_id),
	FOREIGN KEY (fk_username) REFERENCES login_table(username),
	FOREIGN KEY (fk_employee_id) REFERENCES employee_table(employee_id)
);

CREATE TABLE login_customer_link
(
	fk_username VARCHAR(50),
	fk_customer_id VARCHAR(8),
	PRIMARY KEY (fk_username, fk_customer_id),
	FOREIGN KEY (fk_username) REFERENCES login_table(username),
	FOREIGN KEY (fk_customer_id) REFERENCES customer_table(customer_id)
);

CREATE TABLE employee_manager_link
(
	fk_employee_id VARCHAR(8),
	fk_manager_id VARCHAR(8),
	PRIMARY KEY (fk_employee_id, fk_manager_id),
	FOREIGN KEY (fk_employee_id) REFERENCES employee_table(employee_id),
	FOREIGN KEY (fk_manager_id) REFERENCES manager_table(manager_id)
);


COMMIT;

--INSERT SCRIPTS
--Store Table Inserts
--INSERT INTO store_table VALUES ('STR01', 'Store 1');

--Product Table Inserts
--INSERT INTO product_table VALUES ('PID01', 'Product 1', 00.00, 0);

--Location Table Inserts
--INSERT INTO location_table VALUES ('L01', 'Area 1', 'Location 1 Address', 'Postcode');

--Login Table Inserts
--INSERT INTO login_table VALUES ('user1', 'password');

--Manager Table Inserts
--INSERT INTO manager_table VALUES ('M01', 'Manager First Name', 'Manager Last Name');

--Employee Table Inserts
--INSERT INTO employee_table VALUES ('E01', 'Employee First Name', 'Employee Last Name');

--Customer Table Inserts
--INSERT INTO customer_table VALUES ('C01', 'Customer First Name', 'Customer Last Name');

--Store Table and Product Table Link
--INSERT INTO store_product_link VALUES ('STR01', 'PID01');

--Store Table and Location Table Link
--INSERT INTO store_location_link VALUES ('STR01', 'L01');

--Store Table and Customer Table Link
--INSERT INTO store_customer_link VALUES ('STR01', 'C01');

--Store Table and Employee Table Link
--INSERT INTO store_employee_link VALUES ('STR01', 'E01');

--Store Table and Manager Table Link
--INSERT INTO store_manager_link VALUES ('STR01', 'M01');


--Login Table and Manager Table Link
--INSERT INTO login_manager_link VALUES ('user1', 'M01');

--Login Table and Employee Table Link
--INSERT INTO login_employee_link VALUES ('user6', 'E01');

--Login Table and Customer Table Link
--INSERT INTO login_customer_link VALUES ('user16', 'C01');

--Employee Table and Manager Table Link
--INSERT INTO employee_manager_link VALUES ('E01', 'M01');

--COMMIT;
