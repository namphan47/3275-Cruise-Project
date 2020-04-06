DROP TABLE cruise IF EXISTS;
DROP TABLE route IF EXISTS;
DROP TABLE customer IF EXISTS;
DROP TABLE room IF EXISTS;
DROP TABLE roomType IF EXISTS;
DROP TABLE booking IF EXISTS;
DROP TABLE onBoardActivity IF EXISTS;
DROP TABLE portOfCall IF EXISTS;
DROP TABLE activity IF EXISTS;


CREATE TABLE onBoardActivity(
 activityID INTEGER PRIMARY KEY,
 activityName VARCHAR(5000),
 guestCount INTEGER,
 description VARCHAR(5000),
 price NUMBER,
 imageSrc VARCHAR(5000)
);



CREATE TABLE route (
	routeID INTEGER PRIMARY KEY,
	name VARCHAR(300),
	ship VARCHAR(300),
	startDate FLOAT,
	returnDate FLOAT,
	video VARCHAR(3000),
	minPriceForTwo INTEGER
);


CREATE TABLE cruise (
	cruiseID INTEGER PRIMARY KEY,
	name VARCHAR(300),
	routeIDs VARCHAR(300)
);



CREATE TABLE customer (
  id INTEGER PRIMARY KEY AUTO_INCREMENT,
  email VARCHAR(300),
  password VARCHAR(3000)
);


CREATE TABLE room(
  roomNumber INTEGER PRIMARY KEY,
  roomTypeID INTEGER
);

CREATE TABLE roomType(
  roomTypeID INTEGER PRIMARY KEY,
  name VARCHAR(500),
  basePrice INTEGER,
  description VARCHAR(5000),	
  image VARCHAR(5000)	
);

CREATE TABLE booking(
 bookingID INTEGER PRIMARY KEY,
 guestCount INTEGER,
 customerID INTEGER,
 routeID INTEGER,
 roomNumber INTEGER
);


CREATE TABLE portOfCall(
 portName VARCHAR(500),
 portDesc VARCHAR(500),
 price INTEGER,
 imageSrc VARCHAR(500)
);

CREATE TABLE activity(
 id INTEGER PRIMARY KEY,
 guestCount INTEGER,
 bookingID INTEGER
);
