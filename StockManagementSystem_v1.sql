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
INSERT INTO store_table VALUES ('STR01', 'Store 1');
INSERT INTO store_table VALUES ('STR02', 'Store 2');
INSERT INTO store_table VALUES ('STR03', 'Store 3');
INSERT INTO store_table VALUES ('STR04', 'Store 4');
INSERT INTO store_table VALUES ('STR05', 'Store 5');


--Product Table Inserts
INSERT INTO product_table VALUES ('PID01', 'Product 1', 00.00, 0);
INSERT INTO product_table VALUES ('PID02', 'Product 2', 00.00, 0);
INSERT INTO product_table VALUES ('PID03', 'Product 3', 00.00, 0);
INSERT INTO product_table VALUES ('PID04', 'Product 4', 00.00, 0);
INSERT INTO product_table VALUES ('PID05', 'Product 5', 00.00, 0);
INSERT INTO product_table VALUES ('PID06', 'Product 6', 00.00, 0);
INSERT INTO product_table VALUES ('PID07', 'Product 7', 00.00, 0);
INSERT INTO product_table VALUES ('PID08', 'Product 8', 00.00, 0);
INSERT INTO product_table VALUES ('PID09', 'Product 9', 00.00, 0);
INSERT INTO product_table VALUES ('PID10', 'Product 10', 00.00, 0);
INSERT INTO product_table VALUES ('PID11', 'Product 11', 00.00, 0);
INSERT INTO product_table VALUES ('PID12', 'Product 12', 00.00, 0);
INSERT INTO product_table VALUES ('PID13', 'Product 13', 00.00, 0);
INSERT INTO product_table VALUES ('PID14', 'Product 14', 00.00, 0);
INSERT INTO product_table VALUES ('PID15', 'Product 15', 00.00, 0);
INSERT INTO product_table VALUES ('PID16', 'Product 16', 00.00, 0);
INSERT INTO product_table VALUES ('PID17', 'Product 17', 00.00, 0);
INSERT INTO product_table VALUES ('PID18', 'Product 18', 00.00, 0);
INSERT INTO product_table VALUES ('PID19', 'Product 19', 00.00, 0);
INSERT INTO product_table VALUES ('PID20', 'Product 20', 00.00, 0);

--Location Table Inserts
INSERT INTO location_table VALUES ('L01', 'Area 1', 'Location 1 Address', 'Postcode');
INSERT INTO location_table VALUES ('L02', 'Area 2', 'Location 2 Address', 'Postcode');
INSERT INTO location_table VALUES ('L03', 'Area 3', 'Location 3 Address', 'Postcode');
INSERT INTO location_table VALUES ('L04', 'Area 4', 'Location 4 Address', 'Postcode');
INSERT INTO location_table VALUES ('L05', 'Area 5', 'Location 5 Address', 'Postcode');

--Login Table Inserts
INSERT INTO login_table VALUES ('user1', 'password');
INSERT INTO login_table VALUES ('user2', 'password');
INSERT INTO login_table VALUES ('user3', 'password');
INSERT INTO login_table VALUES ('user4', 'password');
INSERT INTO login_table VALUES ('user5', 'password');
INSERT INTO login_table VALUES ('user6', 'password');
INSERT INTO login_table VALUES ('user7', 'password');
INSERT INTO login_table VALUES ('user8', 'password');
INSERT INTO login_table VALUES ('user9', 'password');
INSERT INTO login_table VALUES ('user10', 'password');
INSERT INTO login_table VALUES ('user11', 'password');
INSERT INTO login_table VALUES ('user12', 'password');
INSERT INTO login_table VALUES ('user13', 'password');
INSERT INTO login_table VALUES ('user14', 'password');
INSERT INTO login_table VALUES ('user15', 'password');
INSERT INTO login_table VALUES ('user16', 'password');
INSERT INTO login_table VALUES ('user17', 'password');
INSERT INTO login_table VALUES ('user18', 'password');
INSERT INTO login_table VALUES ('user19', 'password');
INSERT INTO login_table VALUES ('user20', 'password');
INSERT INTO login_table VALUES ('user21', 'password');
INSERT INTO login_table VALUES ('user22', 'password');
INSERT INTO login_table VALUES ('user23', 'password');
INSERT INTO login_table VALUES ('user24', 'password');
INSERT INTO login_table VALUES ('user25', 'password');

--Manager Table Inserts
INSERT INTO manager_table VALUES ('M01', 'Manager First Name', 'Manager Last Name');
INSERT INTO manager_table VALUES ('M02', 'Manager First Name', 'Manager Last Name');
INSERT INTO manager_table VALUES ('M03', 'Manager First Name', 'Manager Last Name');
INSERT INTO manager_table VALUES ('M04', 'Manager First Name', 'Manager Last Name');
INSERT INTO manager_table VALUES ('M05', 'Manager First Name', 'Manager Last Name');

--Employee Table Inserts
INSERT INTO employee_table VALUES ('E01', 'Employee First Name', 'Employee Last Name');
INSERT INTO employee_table VALUES ('E02', 'Employee First Name', 'Employee Last Name');
INSERT INTO employee_table VALUES ('E03', 'Employee First Name', 'Employee Last Name');
INSERT INTO employee_table VALUES ('E04', 'Employee First Name', 'Employee Last Name');
INSERT INTO employee_table VALUES ('E05', 'Employee First Name', 'Employee Last Name');
INSERT INTO employee_table VALUES ('E06', 'Employee First Name', 'Employee Last Name');
INSERT INTO employee_table VALUES ('E07', 'Employee First Name', 'Employee Last Name');
INSERT INTO employee_table VALUES ('E08', 'Employee First Name', 'Employee Last Name');
INSERT INTO employee_table VALUES ('E09', 'Employee First Name', 'Employee Last Name');
INSERT INTO employee_table VALUES ('E10', 'Employee First Name', 'Employee Last Name');

--Customer Table Inserts
INSERT INTO customer_table VALUES ('C01', 'Customer First Name', 'Customer Last Name');
INSERT INTO customer_table VALUES ('C02', 'Customer First Name', 'Customer Last Name');
INSERT INTO customer_table VALUES ('C03', 'Customer First Name', 'Customer Last Name');
INSERT INTO customer_table VALUES ('C04', 'Customer First Name', 'Customer Last Name');
INSERT INTO customer_table VALUES ('C05', 'Customer First Name', 'Customer Last Name');
INSERT INTO customer_table VALUES ('C06', 'Customer First Name', 'Customer Last Name');
INSERT INTO customer_table VALUES ('C07', 'Customer First Name', 'Customer Last Name');
INSERT INTO customer_table VALUES ('C08', 'Customer First Name', 'Customer Last Name');
INSERT INTO customer_table VALUES ('C09', 'Customer First Name', 'Customer Last Name');
INSERT INTO customer_table VALUES ('C10', 'Customer First Name', 'Customer Last Name');

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
INSERT INTO login_manager_link VALUES ('user1', 'M01');
INSERT INTO login_manager_link VALUES ('user2', 'M02');
INSERT INTO login_manager_link VALUES ('user3', 'M03');
INSERT INTO login_manager_link VALUES ('user4', 'M04');
INSERT INTO login_manager_link VALUES ('user5', 'M05');

--Login Table and Employee Table Link
INSERT INTO login_employee_link VALUES ('user6', 'E01');
INSERT INTO login_employee_link VALUES ('user7', 'E02');
INSERT INTO login_employee_link VALUES ('user8', 'E03');
INSERT INTO login_employee_link VALUES ('user9', 'E04');
INSERT INTO login_employee_link VALUES ('user10', 'E05');
INSERT INTO login_employee_link VALUES ('user11', 'E06');
INSERT INTO login_employee_link VALUES ('user12', 'E07');
INSERT INTO login_employee_link VALUES ('user13', 'E08');
INSERT INTO login_employee_link VALUES ('user14', 'E09');
INSERT INTO login_employee_link VALUES ('user15', 'E10');

--Login Table and Customer Table Link
INSERT INTO login_customer_link VALUES ('user16', 'C01');
INSERT INTO login_customer_link VALUES ('user17', 'C02');
INSERT INTO login_customer_link VALUES ('user18', 'C03');
INSERT INTO login_customer_link VALUES ('user19', 'C04');
INSERT INTO login_customer_link VALUES ('user20', 'C05');
INSERT INTO login_customer_link VALUES ('user21', 'C06');
INSERT INTO login_customer_link VALUES ('user22', 'C07');
INSERT INTO login_customer_link VALUES ('user23', 'C08');
INSERT INTO login_customer_link VALUES ('user24', 'C09');
INSERT INTO login_customer_link VALUES ('user25', 'C10');

--Employee Table and Manager Table Link
INSERT INTO employee_manager_link VALUES ('E01', 'M01');
INSERT INTO employee_manager_link VALUES ('E02', 'M02');
INSERT INTO employee_manager_link VALUES ('E03', 'M03');
INSERT INTO employee_manager_link VALUES ('E04', 'M04');
INSERT INTO employee_manager_link VALUES ('E05', 'M05');

COMMIT;
