DROP TABLE cruise IF EXISTS;
DROP TABLE registrations IF EXISTS;
DROP TABLE students IF EXISTS;
DROP TABLE courses IF EXISTS;

CREATE TABLE cruise (
cruiseID INT PRIMARY KEY,
name VARCHAR(30),
routeID INTEGER,
FOREIGN KEY (routeID) references route(routeID)
);

CREATE TABLE route (
routeID INTEGER PRIMARY KEY
name VARCHAR(30),
ship VARCHAR(30),
startDate DATE,
returnDate DATE,
video VARCHAR(30),
minPriceForTwo INTEGER,
activityID INTEGER,
FOREIGN KEY (activityID) references activity(activityID)
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


