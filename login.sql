CREATE TABLE login_table
(
	username VARCHAR(50),
	password VARCHAR(20),
	CONSTRAINT username_pk PRIMARY KEY (username)
);

CREATE TABLE manager_table
(
	manager_id VARCHAR(8),
	manager_firstName VARCHAR(20),
	manager_lastName VARCHAR(20),
	CONSTRAINT manager_id_pk PRIMARY KEY (manager_id)
);

CREATE TABLE employee_table
(
	employee_id VARCHAR(8),
	employee_firstName VARCHAR(20),
	employee_lastName VARCHAR(20),
	CONSTRAINT employee_id_pk PRIMARY KEY (employee_id)
);

CREATE TABLE customer_table
(
	customer_id VARCHAR(8),
	customer_firstName VARCHAR(20),
	customer_lastName VARCHAR(20),
	CONSTRAINT customer_id_pk PRIMARY KEY (customer_id)
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

COMMIT;

--INSERT SCRIPTS
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

COMMIT;
