DROP TABLE cruise IF EXISTS;
DROP TABLE route IF EXISTS;
DROP TABLE customer IF EXISTS;
DROP TABLE room IF EXISTS;
DROP TABLE roomType IF EXISTS;
DROP TABLE booking IF EXISTS;
DROP TABLE onBoardActivity IF EXISTS;
DROP TABLE portOfCall IF EXISTS;


CREATE TABLE onBoardActivity(
 activityID INTEGER PRIMARY KEY,
 activityName VARCHAR(50),
 guestCount INTEGER,
 description VARCHAR(50),
 price NUMBER,
 imageSrc VARCHAR(50)
);



CREATE TABLE route (
routeID INTEGER PRIMARY KEY,
name VARCHAR(30),
ship VARCHAR(30),
startDate DATE,
returnDate DATE,
video VARCHAR(30),
minPriceForTwo INTEGER,
activityID INTEGER,
);


CREATE TABLE cruise (
cruiseID INT PRIMARY KEY,
name VARCHAR(30),
routeID INTEGER,
);



CREATE TABLE customer (
  customerID INTEGER PRIMARY KEY,
  name VARCHAR(30),
  password VARCHAR(30)
);


CREATE TABLE room(
  roomNumber INTEGER PRIMARY KEY,
  roomType VARCHAR(50),
  roomTypeID INTEGER,
  price DOUBLE
  
);

CREATE TABLE roomType(
  roomTypeID INTEGER PRIMARY KEY,
  name VARCHAR(50),
  basePrice NUMBER,
  description VARCHAR(50)	
);

CREATE TABLE booking(
 bookingID INTEGER PRIMARY KEY,
 guestCount INTEGER,
 customerID INTEGER,
 routeID INTEGER,
 activityID INTEGER,
 roomNumber INTEGER,

);


CREATE TABLE portOfCall(
 portName VARCHAR(50),
 portDesc VARCHAR(50),
 price NUMBER,
 imageSrc VARCHAR(50)
);

