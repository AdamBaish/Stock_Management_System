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
INSERT INTO store_table VALUES ('STR01', 'Table Talk');
INSERT INTO store_table VALUES ('STR02', 'Mug Factory');
INSERT INTO store_table VALUES ('STR03', 'Bed Bank');
INSERT INTO store_table VALUES ('STR04', 'Light House');
INSERT INTO store_table VALUES ('STR05', 'Card Mart');


--Product Table Inserts
INSERT INTO product_table VALUES ('PID01', 'Glass Table', 79.99, 5);
INSERT INTO product_table VALUES ('PID02', 'Wood Table', 99.99, 2);
INSERT INTO product_table VALUES ('PID03', 'Metal Table', 59.99, 0);
INSERT INTO product_table VALUES ('PID04', 'Plastic Table', 29.99, 13);
INSERT INTO product_table VALUES ('PID05', 'Red Mug', 9.99, 10);
INSERT INTO product_table VALUES ('PID06', 'White Mug', 9.99, 4);
INSERT INTO product_table VALUES ('PID07', 'Cat Mug', 13.45, 3);
INSERT INTO product_table VALUES ('PID08', 'Dog Mug', 13.45, 6);
INSERT INTO product_table VALUES ('PID09', 'Single Size Bed', 99.99, 20);
INSERT INTO product_table VALUES ('PID10', 'Double Size Bed', 189.99, 6);
INSERT INTO product_table VALUES ('PID11', 'Queen Size Bed', 279.99, 0);
INSERT INTO product_table VALUES ('PID12', 'King Size Bed', 499.99, 12);
INSERT INTO product_table VALUES ('PID13', 'Ceiling Light', 65.00, 11);
INSERT INTO product_table VALUES ('PID14', 'Bedside Lamp', 32.00, 33);
INSERT INTO product_table VALUES ('PID15', 'Wallmounted Light', 52.49, 7);
INSERT INTO product_table VALUES ('PID16', 'Outdoor Light', 89.99, 2);
INSERT INTO product_table VALUES ('PID17', 'Birthday Card', 3.29, 129);
INSERT INTO product_table VALUES ('PID18', 'Christmas Card', 3.29, 66);
INSERT INTO product_table VALUES ('PID19', 'Congratulations Card', 1.99, 22);
INSERT INTO product_table VALUES ('PID20', 'Condolences Card', 1.99, 16);

--Location Table Inserts
INSERT INTO location_table VALUES ('L01', 'Bournemouth', '102 Blaine Road', 'BH1 3AA');
INSERT INTO location_table VALUES ('L02', 'London', '16 Ballor Way', 'E1 6AE');
INSERT INTO location_table VALUES ('L03', 'Manchester', '393 Callor Road', 'M23 1BE');
INSERT INTO location_table VALUES ('L04', 'Bristol', '1204 Whyte Street', 'BS16 6FG');
INSERT INTO location_table VALUES ('L05', 'York', '2 Maine Road', 'YO1 9DB');

--Login Table Inserts
INSERT INTO login_table VALUES ('adam@site.com', 'password');
INSERT INTO login_table VALUES ('ciearn@site.com', 'password');
INSERT INTO login_table VALUES ('max@site.com', 'password');
INSERT INTO login_table VALUES ('sam@site.com', 'password');
INSERT INTO login_table VALUES ('test', 'TeSt');
INSERT INTO login_table VALUES ('emp1@site.com', 'password');
INSERT INTO login_table VALUES ('emp2@site.com', 'password');
INSERT INTO login_table VALUES ('emp3@site.com', 'password');
INSERT INTO login_table VALUES ('emp4@site.com', 'password');
INSERT INTO login_table VALUES ('emp5@site.com', 'password');
INSERT INTO login_table VALUES ('emp6@site.com', 'password');
INSERT INTO login_table VALUES ('emp7@site.com', 'password');
INSERT INTO login_table VALUES ('emp8@site.com', 'password');
INSERT INTO login_table VALUES ('emp9@site.com', 'password');
INSERT INTO login_table VALUES ('emp10@site.com', 'password');
INSERT INTO login_table VALUES ('carter367@gmail.com', 'PASSword');
INSERT INTO login_table VALUES ('malboliner@outlook.com', 'pa55w0rd');
INSERT INTO login_table VALUES ('nilonman@gmail.com', 'PASSWORD');
INSERT INTO login_table VALUES ('valeldy@hotmail.co.uk', 'pAsswOrd');
INSERT INTO login_table VALUES ('kylekard@outlook.com', 'paSSword');
INSERT INTO login_table VALUES ('numer1D@gmail.com', 'passworD!');
INSERT INTO login_table VALUES ('idkwhoiam@yahoo.com', 'password?');
INSERT INTO login_table VALUES ('waterfallgrl@bt.com', 'pass-w0rD');
INSERT INTO login_table VALUES ('adamjansen@outlook.com', 'p455w0rd');
INSERT INTO login_table VALUES ('silco68@protonmail.com', 'Password');


--Manager Table Inserts
INSERT INTO manager_table VALUES ('M01', 'Adam', 'Baish');
INSERT INTO manager_table VALUES ('M02', 'Cieran', 'Nolan');
INSERT INTO manager_table VALUES ('M03', 'Max', 'Bosiakov');
INSERT INTO manager_table VALUES ('M04', 'Sam', 'Johnson');
INSERT INTO manager_table VALUES ('M05', 'Suzy', 'Manager Last Name');

--Employee Table Inserts
INSERT INTO employee_table VALUES ('E01', 'Alan', 'Bran');
INSERT INTO employee_table VALUES ('E02', 'Carl', 'Darmat');
INSERT INTO employee_table VALUES ('E03', 'Ellen', 'Foyer');
INSERT INTO employee_table VALUES ('E04', 'Gaile', 'Hyrem');
INSERT INTO employee_table VALUES ('E05', 'Isaac', 'Jones');
INSERT INTO employee_table VALUES ('E06', 'Laura', 'Mallord');
INSERT INTO employee_table VALUES ('E07', 'Nick', 'Oberon');
INSERT INTO employee_table VALUES ('E08', 'Paul', 'Quarter');
INSERT INTO employee_table VALUES ('E09', 'Richard', 'Stall');
INSERT INTO employee_table VALUES ('E10', 'Tally', 'Underwood');

--Customer Table Inserts
INSERT INTO customer_table VALUES ('C01', 'Carter', 'Jones');
INSERT INTO customer_table VALUES ('C02', 'Sarah', 'Boliner');
INSERT INTO customer_table VALUES ('C03', 'Harry', 'Brown');
INSERT INTO customer_table VALUES ('C04', 'Vale', 'Summer');
INSERT INTO customer_table VALUES ('C05', 'Kyle', 'Slim');
INSERT INTO customer_table VALUES ('C06', 'Eddie', 'Marshall');
INSERT INTO customer_table VALUES ('C07', 'Crystal', 'Lansen');
INSERT INTO customer_table VALUES ('C08', 'Mary', 'Marlow');
INSERT INTO customer_table VALUES ('C09', 'Adam', 'Jansen');
INSERT INTO customer_table VALUES ('C10', 'William', 'Silco');

--Store Table and Product Table Link
INSERT INTO store_product_link VALUES ('STR01', 'PID01');
INSERT INTO store_product_link VALUES ('STR01', 'PID02');
INSERT INTO store_product_link VALUES ('STR01', 'PID03');
INSERT INTO store_product_link VALUES ('STR01', 'PID04');
INSERT INTO store_product_link VALUES ('STR02', 'PID05');
INSERT INTO store_product_link VALUES ('STR02', 'PID06');
INSERT INTO store_product_link VALUES ('STR02', 'PID07');
INSERT INTO store_product_link VALUES ('STR02', 'PID08');
INSERT INTO store_product_link VALUES ('STR03', 'PID09');
INSERT INTO store_product_link VALUES ('STR03', 'PID10');
INSERT INTO store_product_link VALUES ('STR03', 'PID11');
INSERT INTO store_product_link VALUES ('STR03', 'PID12');
INSERT INTO store_product_link VALUES ('STR04', 'PID13');
INSERT INTO store_product_link VALUES ('STR04', 'PID14');
INSERT INTO store_product_link VALUES ('STR04', 'PID15');
INSERT INTO store_product_link VALUES ('STR04', 'PID16');
INSERT INTO store_product_link VALUES ('STR05', 'PID17');
INSERT INTO store_product_link VALUES ('STR05', 'PID18');
INSERT INTO store_product_link VALUES ('STR05', 'PID19');
INSERT INTO store_product_link VALUES ('STR05', 'PID20');

--Store Table and Location Table Link
INSERT INTO store_location_link VALUES ('STR01', 'L01');
INSERT INTO store_location_link VALUES ('STR02', 'L02');
INSERT INTO store_location_link VALUES ('STR03', 'L03');
INSERT INTO store_location_link VALUES ('STR04', 'L04');
INSERT INTO store_location_link VALUES ('STR05', 'L05');

--Store Table and Customer Table Link
INSERT INTO store_customer_link VALUES ('STR01', 'C01');
INSERT INTO store_customer_link VALUES ('STR01', 'C02');
INSERT INTO store_customer_link VALUES ('STR02', 'C03');
INSERT INTO store_customer_link VALUES ('STR02', 'C04');
INSERT INTO store_customer_link VALUES ('STR03', 'C05');
INSERT INTO store_customer_link VALUES ('STR03', 'C06');
INSERT INTO store_customer_link VALUES ('STR04', 'C07');
INSERT INTO store_customer_link VALUES ('STR04', 'C08');
INSERT INTO store_customer_link VALUES ('STR05', 'C09');
INSERT INTO store_customer_link VALUES ('STR05', 'C10');

--Store Table and Employee Table Link
INSERT INTO store_employee_link VALUES ('STR01', 'E01');
INSERT INTO store_employee_link VALUES ('STR02', 'E02');
INSERT INTO store_employee_link VALUES ('STR03', 'E03');
INSERT INTO store_employee_link VALUES ('STR04', 'E04');
INSERT INTO store_employee_link VALUES ('STR05', 'E05');

--Store Table and Manager Table Link
INSERT INTO store_manager_link VALUES ('STR01', 'M01');
INSERT INTO store_manager_link VALUES ('STR02', 'M02');
INSERT INTO store_manager_link VALUES ('STR03', 'M03');
INSERT INTO store_manager_link VALUES ('STR04', 'M04');
INSERT INTO store_manager_link VALUES ('STR05', 'M05');


--Login Table and Manager Table Link
INSERT INTO login_manager_link VALUES ('adam@site.com', 'M01');
INSERT INTO login_manager_link VALUES ('ciearn@site.com', 'M02');
INSERT INTO login_manager_link VALUES ('max@site.com', 'M03');
INSERT INTO login_manager_link VALUES ('sam@site.com', 'M04');
INSERT INTO login_manager_link VALUES ('test', 'M05');

--Login Table and Employee Table Link
INSERT INTO login_employee_link VALUES ('emp1@site.com', 'E01');
INSERT INTO login_employee_link VALUES ('emp2@site.com', 'E02');
INSERT INTO login_employee_link VALUES ('emp3@site.com', 'E03');
INSERT INTO login_employee_link VALUES ('emp4@site.com', 'E04');
INSERT INTO login_employee_link VALUES ('emp5@site.com', 'E05');
INSERT INTO login_employee_link VALUES ('emp6@site.com', 'E06');
INSERT INTO login_employee_link VALUES ('emp7@site.com', 'E07');
INSERT INTO login_employee_link VALUES ('emp8@site.com', 'E08');
INSERT INTO login_employee_link VALUES ('emp9@site.com', 'E09');
INSERT INTO login_employee_link VALUES ('emp10@site.com', 'E10');

--Login Table and Customer Table Link
INSERT INTO login_customer_link VALUES ('carter367@gmail.com', 'C01');
INSERT INTO login_customer_link VALUES ('malboliner@outlook.com', 'C02');
INSERT INTO login_customer_link VALUES ('nilonman@gmail.com', 'C03');
INSERT INTO login_customer_link VALUES ('valeldy@hotmail.co.uk', 'C04');
INSERT INTO login_customer_link VALUES ('kylekard@outlook.com', 'C05');
INSERT INTO login_customer_link VALUES ('numer1D@gmail.com', 'C06');
INSERT INTO login_customer_link VALUES ('idkwhoiam@yahoo.com', 'C07');
INSERT INTO login_customer_link VALUES ('waterfallgrl@bt.com', 'C08');
INSERT INTO login_customer_link VALUES ('adamjansen@outlook.com', 'C09');
INSERT INTO login_customer_link VALUES ('silco68@protonmail.com', 'C10');

--Employee Table and Manager Table Link
INSERT INTO employee_manager_link VALUES ('E01', 'M01');
INSERT INTO employee_manager_link VALUES ('E02', 'M02');
INSERT INTO employee_manager_link VALUES ('E03', 'M03');
INSERT INTO employee_manager_link VALUES ('E04', 'M04');
INSERT INTO employee_manager_link VALUES ('E05', 'M05');

COMMIT;
