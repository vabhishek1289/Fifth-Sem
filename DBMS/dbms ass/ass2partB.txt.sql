create table Sales(OrderId integer, OrderDate date,OrderPrice integer,OrderQuantity integer, Customername varchar(20));


insert into Sales values('1','2001-04-05','300','5','Peter');
insert into Sales values('2','2006-12-01','100','2','Smith');
insert into Sales values('3','2004-11-02','400','4','Jones');
insert into Sales values('4','2004-01-05','150','3','Peter');
insert into Sales values('5','2006-02-03','500','3','Jones');
insert into Sales values('6','2008-12-04','100','6','Peter');
insert into Sales values('7','2006-09-05','225','1','Peter');
insert into Sales values('8','2004-12-06','600','1','Smith');
insert into Sales values('9','2006-05-05','170','6','Peter');
insert into Sales values('10','2006-11-05','550','3','Peter');
insert into Sales values('11','2003-10-06','200','2','Smith');

select count(OrderId) from Sales where Customername='Smith';
select count(distinct Customername) from Sales;
select sum(OrderQuantity) from Sales;
select avg(OrderQuantity) from Sales;
select avg(OrderQuantity) from Sales where OrderPrice>200;
select min(OrderPrice) from Sales;
select max(OrderPrice) from Sales;
select distinct Customername from Sales;
select Customername,OrderDate from Sales group by OrderDate having month(OrderDate)=12;
select Customername,sum(OrderPrice*orderQuantity) as 'total' from Sales group by Customername;
select Customername from Sales group by Customername having sum(OrderPrice*orderQuantity)>1200;
select Customername from Sales having count(Customername)>5;
select Customername from Sales where OrderDate>'2005-01-10' group by Customername having sum(OrderPrice*orderQuantity)>1000;
select * from Sales order by OrderPrice;
select * from Sales order by OrderPrice desc;


