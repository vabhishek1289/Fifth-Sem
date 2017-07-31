create table Hotel(Hotel_no integer primary key,name varchar(20),address varchar(20));
desc Hotel;
insert into Hotel values(1,'Radisson','London');
insert into Hotel values(2,'TajHotel','Delhi');
insert into Hotel values(3,'ICH','Bombay');
insert into Hotel values(4,'Paradise','London');
insert into Hotel values(5,'Hotel Ivy','Delhi');
insert into Hotel values(6,'Grosvernor','Delhi');
select * from Hotel;
create table Room (Room_no integer,Hotel_no integer,Type varchar(10),Price integer,primary key(Room_no,Hotel_no));
desc Room;
insert into Room values(111,1,'single',150);
insert into Room values(112,1,'single',150);
insert into Room values(113,1,'double',175);
insert into Room values(114,1,'family',190);
insert into Room values(211,2,'family',190);
insert into Room values(212,2,'single',300);
insert into Room values(213,2,'double',175);
insert into Room values(311,3,'double',400);
insert into Room values(312,3,'double',600);
insert into Room values(313,3,'single',150);
insert into Room values(314,3,'single',125);
insert into Room values(315,3,'single',300);
insert into Room values(411,4,'family',175);
insert into Room values(412,4,'family',400);
insert into Room values(511,5,'double',185);
insert into Room values(611,6,'single',150);
insert into Room values(612,6,'single',350);
insert into Room values(613,6,'double',175);
insert into Room values(614,6,'double',400);
insert into Room values(615,6,'family',600);
insert into Room values(616,6,'family',800);
select * from Room;
create table Booking(Hotel_no integer,Guest_no integer,Date_from date,Date_to date,Room_no integer);
desc Booking;
insert into Booking values(1,101,'2016-08-01','2016-08-03',113);
insert into Booking values(1,102,'2016-08-02','2016-08-05',114);
insert into Booking values(2,103,'2016-02-03','',212);
insert into Booking values(3,104,'2016-08-04','2016-08-08',311);
insert into Booking values(3,105,'2016-03-05','',313);
insert into Booking values(4,106,'2016-08-06','2016-08-08',411);
insert into Booking values(4,107,'2016-04-07','2016-04-10',412);
insert into Booking values(5,108,'2016-05-08','2016-05-13',511);
insert into Booking values(6,109,'2016-08-09','2016-08-15',611);
insert into Booking values(6,110,'2016-06-10','',613);
insert into Booking values(6,111,'2016-08-11','2016-08-13',614);
insert into Booking values(6,112,'2016-08-12','2016-08-14',616);
select * from Booking;
create table Guest(Guest_no integer primary key,name varchar(20),address varchar(20));
desc Guest;
insert into Guest values(101,'Alex','London');
insert into Guest values(102,'Praveen','Bombay');
insert into Guest values(103,'Rick','London');
insert into Guest values(104,'Ramesh','Delhi');
insert into Guest values(105,'John','NewYork');
insert into Guest values(106,'Philip','London');
insert into Guest values(107,'Pankaj','Delhi');
insert into Guest values(108,'Dave','LosAngeles');
insert into Guest values(109,'Bucky','London');
insert into Guest values(110,'Ashutosh','Bombay');
insert into Guest values(111,'Peter','Paris');
insert into Guest values(112,'Bob','LosAngeles');
select * from Guest;