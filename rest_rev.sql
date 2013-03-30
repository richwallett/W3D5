CREATE TABLE chef (
	id INTEGER PRIMARY KEY,
	fname VARCHAR(20) NOT NULL,
	lname VARCHAR(20) NOT NULL,
	mentorid VARCHAR(20)	
);

INSERT INTO chef (fname, lname, mentorid)
VALUES ("Rich", "Wallett", "2"), ("Wolfgang", "Puck", "1"), ("Dylan", "Clark", "1"),
		("M", "Morimoto", "1"), ("Giada", "DeLaurentis", "3");

CREATE TABLE restaurant (
	id INTEGER PRIMARY KEY,
	name VARCHAR(20) NOT NULL,
	neighborhood VARCHAR(20) NOT NULL,
	cuisine VARCHAR(20)	NOT NULL
);

INSERT INTO restaurant (name, neighborhood, cuisine)
VALUES ("Chenery Park", "Glen Park", "California"), ("Lee's Deli", "SOMA", "Chinese"),
 		("Toaster Over", "SOMA", "Sandwiches"), 
		("Specialtys", "Financial District", "Bakery");


CREATE TABLE tenure (
	id INTEGER PRIMARY KEY,
	chefid VARCHAR(20) NOT NULL,
	rest_worked VARCHAR(20) NOT NULL,
	startdate DATE NOT NULL,
	enddate DATE NOT NULL,
	headchef Char(1) CHECK (headchef IN ('T', 'F')),

	FOREIGN KEY (chefid) REFERENCES chef(id)
);

INSERT INTO tenure (chefid, rest_worked, startdate, enddate, headchef)
VALUES ("1", "Chenery Park", '2012-01-01', '2013-01-01', 'T'), ('1', "Lee's Deli",'2010-01-02', '2011-12-12', 'F'),
		('2', "Toaster Oven",'2008-12-05', '2013-01-10', 'T'), ('3', "Specialtys",'2005-12-01', '2008-05-07', 'T'),
		('4', "Toaster Oven",'2002-08-05', '2010-01-10', 'F'), ('5', "Chenery Park", '2002-1-01', '2010-04-02', 'T');

CREATE TABLE critic (
	id INTEGER PRIMARY KEY,
	screenname VARCHAR(20) NOT NULL
);

INSERT INTO critic (screenname)
VALUES ('pWnBlasT0r5'), ('FoOd4LyFe'), ('EatStuff8'), ('YelpMeOut');

CREATE TABLE reviews (
	id INTEGER PRIMARY KEY,
	reviewer_id INTEGER NOT NULL,
	rest_reviewed INTEGER NOT NULL,
	review TEXT NOT NULL,
	date DATE NOT NULL,
	score INTEGER NOT NULL,

	FOREIGN KEY(reviewer_id) REFERENCES screenname(id),
	FOREIGN KEY(rest_reviewed) REFERENCES restaurant(id)
);

INSERT INTO reviews (reviewer_id, rest_reviewed, review, date, score)
VALUES ('1', '1', 'I ate things and digested them', '2011-04-30', '19'),
		('1', '2', 'I ate a dog', '2011-08-13', '15'),
		('2', '3', 'I ate a cat', '2009-07-24', '10'),
		('3', '2', 'I ate a person', '2013-02-28', '9'),
		('4', '1', 'I did not eat because there was a sabertooth tiger outside', '2012-10-15', '19'),
		('4', '2', 'I ate things...in reverse', '2010-05-31', '5');








