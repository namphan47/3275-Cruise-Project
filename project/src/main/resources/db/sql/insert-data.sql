
INSERT INTO roomType VALUES(1,'Inside',5000,'Sail away in a generous-sized stateroom');
INSERT INTO roomType VALUES(2,'OceanView',7000,'Unwind in roomy quarters');
INSERT INTO roomType VALUES(3,'Verandah',9000,'These are our most spacious non-Concierge staterooms');

Insert INTO onBoardActivity
VALUES(1,'Beverage Tastings',100,'Discover libation tastings that take you from Amari to Whiskey with an assortment of pleasurable beverages in between!', 100, '../resources/images/activity_1.png');
Insert INTO onBoardActivity
VALUES(2,'Pirate Night',100,'  On select itineraries, eat, dance and be merry at a buccaneer bash fit for a pirate.', 100, '../resources/images/activity_2.png');
Insert INTO onBoardActivity
VALUES(3,'A Musical Spectacular',80,'Be enchanted as the magic of Frozen springs to life before your eyes in this musical extravaganza.', 100, '../resources/images/activity_3.png');

INSERT INTO route
VALUES(1, 'Dawes Glacier, Alaska | Skagway, Alaska | Juneau, Alaska | Ketchikan, Alaska', 'Disney Wonder ship', 1595203200000,1595808000000, '../resources/videos/video1.mp4', 5000, 1);

INSERT INTO customer
VALUES(1,'KRISHMA', 'sukhija90');


--INSERT INTO  Booking
--VALUES(1, 'Beverage Tastings' ,2, 'Discover libation tastings that take you from Amari to Whiskey with an assortment of pleasurable beverages in between!' , 100, 'activity_1.png' );
--
--INSERT INTO  Booking
--VALUES(2, 'Pirate Night' ,2 , 'On select itineraries, eat, dance and be merry at a buccaneer bash fit for a pirate.' ,100, 'activity_2.png' );
--
--INSERT INTO  Booking
--VALUES(3, 'Frozen, A Musical Spectacular' ,3 , 'Be enchanted as the magic of Frozen springs to life before your eyes in this musical extravaganza inside the Walt Disney Theatre—now playing on the Disney Wonder and the Disney Fantasy.' , 100 , 'activity_3.png' );


INSERT INTO portOfCall
VALUES( 'Ketchikan' , ' Winner of seven regional Emmys and three national Telly awards, the Ketchikan Story Project chronicles the life and times of Alaska First City.' , 200 , 'port_1.png' );

INSERT INTO portOfCall
VALUES( 'Homer' , 'A most distinguishing feature is the Homer Spit, which is a gravel bar extending into the bay on which Homer Harbor lies.' , 200 , 'port_2.png' ) ;


INSERT INTO cruise
VALUES(1 , 'Alaska' ,1 );

INSERT INTO cruise
VALUES(2 , 'Dawes Glacier' ,2 );

INSERT INTO cruise
VALUES(3 , 'Juneau' ,2 );



INSERT INTO room
VALUES(101 , 'Inside' ,1 ,200);

INSERT INTO room
VALUES(202 , 'Oceanview' ,1 ,200);

INSERT INTO room
VALUES(01 , 'Verandah' ,1 ,200);

