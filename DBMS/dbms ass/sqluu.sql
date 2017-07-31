
			ASSIGNMENT 2 (PART A)




create table Product(p_no integer primary key, p_name varchar(15),p_selling_price integer,p_manuf_name varchar(20));
create table Client(c_no varchar(15) primary key ,c_name varchar(20) ,c_address varchar(20) ,c_city varchar(20),c_pin integer, c_state varchar(20),c_tot_bal integer);
create table Orders(o_no varchar(20) primary key,o_order_date date,c_no varchar(15),s_no varchar(20) unique key, o_bill_status varchar(20),o_dlry_date date,foreign key(c_no) references Client(c_no));
create table Salesman(s_name varchar(20),s_address varchar(20),s_city varchar(20), s_pin integer, s_state varchar(20), s_salary integer,s_dlry_date date unique key, s_total_qnty integer,s_rate integer,s_no varchar(20) primary key);



insert into Product values(1,'HDD1034',3000,'Saegate');
insert into Product values(2,'Mouse',500,'Debian');
insert into Product values(3,'Pen Drive',2500,'PNY');
insert into Product values(4,'DVDRW',6000,'Sony');
insert into Product values(5,'Keyboard',1000,'Zebronics');
insert into Product values(6,'Webcam',7000,'Frontech');
insert into Product values(7,'Headsets',4000,'Philips');


insert into Client values('CN1003','Alex','Treasure Town','Bombay','999479','Maharashtra',5000);
insert into Client values('CN1045','Raj','Ram Nagar','Chennai','545612','Tamil Nadu',4000);
insert into Client values('CN1054','John','Omaxe City','Kolkata','845732','West Bengal',3000);
insert into Client values('CN1089','Mahesh','DLF Township','Nagpur','789215','Maharashtra',2000);
insert into Client values('CN1044','Ketou','China Town','Tejpur','412511','Assam',1000);
insert into Client values('CN1078','Aron','Gandhi Nagar','Silchar','454145','Assam',2000);
insert into Client values('CN1055','Abhishek','Vijay Nagar','Pune','777891','Maharashtra',5000);
insert into Client values('CN1000','Aaditya','Shakti Nagar','Nagpur','457232','Maharashtra',3000);



insert into Orders values('ON01008','2008-08-22','CN1003','sn0001','yes','2008-08-25');
insert into Orders values('ON01009','2008-07-23','CN1054','sn0002','no','2008-07-20');
insert into Orders values('ON01007','2008-06-24','CN1078','sn0003','yes','2008-06-20');
insert into Orders values('ON01006','2009-12-25','CN1045','sn0004','yes','2009-12-20');
insert into Orders values('ON01005','2009-04-26','CN1044','sn0005','no','2009-04-20');
insert into Orders values('ON01004','2009-08-27','CN1055','sn0006','no','2009-08-21');
insert into Orders values('ON01003','2009-03-28','CN1003','sn0007','yes','2009-03-22');
insert into Orders values('ON01002','2009-05-29','CN1045','sn0008','no','2009-05-23');
insert into Orders values('ON01001','2009-04-30','CN1003','sn0009','yes','2009-04-20');
insert into Orders values('ON01000','2009-07-02','CN1055','sn0010','no','2009-07-24');



insert into Salesman values('Saransh','Vallabh Nagar','Indore','452019','Madhya Pradesh','24000','2008-08-25',2,2,'sn0001');
insert into Salesman values('Aditya','Omaxe Town','Bhopal','452013','Madhya Pradesh','40000','2008-07-20',1,3,'sn0002');
insert into Salesman values('Siddhanth','New Area','Dewas','452012','Madhya Pradesh','20000','2008-06-20',2,2,'sn0003');
insert into Salesman values('Siddharth','Civil Line','Ujjain','452039','Madhya Pradesh','90000','2009-12-20',3,4,'sn0004');
insert into Salesman values('Srajan','DMX Township','Nagda','452029','Madhya Pradesh','80000','22009-04-20',1,5,'sn0005');
insert into Salesman values('Sarthak','Vijay Nagar','Satna','452419','Madhya Pradesh','70000','22009-08-21',3,6,'sn0006');
insert into Salesman values('Ashutosh','Aawas Line','Gwalior','452219','Madhya Pradesh','60000','2009-03-22',2,1,'sn0007');
insert into Salesman values('Aanand','Adarsh Nagar','Jabalpur','452419','Madhya Pradesh','50000','2009-05-23',1,2,'sn0008');
insert into Salesman values('Avinash','Civil Line','Ratlam','455019','Madhya Pradesh','40000','2009-04-20',2,4,'sn0009');
insert into Salesman values('Alok','Vallabh Nagar','Sagar','453201','Madhya Pradesh','30000','2009-07-24',3,2,'sn0010');


 select c_name,c_city from Client;
 select distinct p_name from Product;
 select c_name from Client where c_name like '_a%';
 select c_name from Client where c_city='Nagpur';
 select * from Product where p_selling_price between 2000 and 5000;
 mysql> alter table Product 
    -> add column NEW_PRICE integer;
alter table Salesman change column s_rate new_product_rate integer;
select * from Product order by p_name;
 select c_no,o_order_date from Orders;
 delete from Orders where o_dlry_date<'2008-08-25';
update Orders set o_dlry_date='2008-08-16' where c_no='CN1003';
update Client set c_tot_bal=1200 where c_no='CN1003';
select * from Product where  p_name='HDD1034' or p_name='DVDRW';
select c_name,c_city,c_state from Client where c_city !='Assam';
select * from Orders where o_bill_status='no' and month(o_dlry_date)=03; 























