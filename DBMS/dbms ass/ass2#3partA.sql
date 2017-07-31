create table customer (cname varchar(20) primary key,city varchar(20));

create table branch (bname varchar(20) primary key,city varchar(20));

create table deposit (actno int,cname varchar(20),bname varchar(20),amount int, adate date,foreign key (cname) references customer(cname),foreign key (bname) references branch(bname) on update cascade);

create table borrow (loan_no int,cname varchar(20),bname varchar(20),amount int, foreign key (cname) references customer(cname),foreign key (bname) references branch(bname) on update cascade);	


insert into customer values('Anil','Bombay');
insert into customer values('Sunil','Nagpur');
insert into customer values('Rahul','Nagpur');
insert into customer values('Rajesh','Bombay');

insert into branch values('abc','Bombay');
insert into branch values('def','Nagpur');
insert into branch values('ghi','Bombay');

insert into deposit values ('1','Sunil','abc','5000','2003-01-01');
insert into deposit values ('2','Rahul','ghi','400','2005-01-01');
insert into deposit values ('3','Anil','abc','9000','2005-01-01');
insert into deposit values ('4','Rajesh','def','2000','2005-01-01');
insert into deposit values ('5','Rajesh','ghi','500','2005-01-01');

insert into borrow values ('11','Sunil','abc','100');
insert into borrow values ('12','Anil','abc','200');
insert into borrow values ('13','Rahul','abc','300');
insert into borrow values ('14','Rahul','def','4000');

select d.* from deposit d,customer c where d.cname=c.cname and c.city="Nagpur" ;
select distinct d.cname,b.city from branch b,deposit d where b.bname=d.bname and d.cname="Anil" or d.cname="Sunil";
select c.cname,d.amount "Deposit",b.amount "Borrow" from customer c,(deposit d,borrow b) where (c.cname=d.cname and c.cname=b.cname) and (d.amount>1000 and b.amount<1000); 
select cname,city from customer where cname in (select cname from deposit where bname="abc");
select sum(amount) "Total_bal",avg(amount) "Average_bal" from borrow;
select min(amount) "Minimin_bal",max(amount) "Maximum_bal" from deposit;
select distinct * from branch order by city;
select sum(amount) from borrow where bname="abc";
select * from branch group by city having count(city)=1;
select cname,max(amount) from deposit where cname in(select cname from customer where city="Bombay");
select count(distinct city) "Tot_city" from branch;
select bname,sum(amount) from deposit group by bname; 
select c1.city,sum(d1.amount) from customer c1,deposit d1 where d1.cname=c1.cname group by c1.city;
select bname,count(cname) from deposit group by bname;
select bname from deposit group by bname having sum(amount)>1000;
select bname from borrow group by bname having count(bname)>2; 
select cname from deposit where bname in(select bname from deposit group by bname having avg(amount)>5000);
select bname,count(cname) from borrow group by bname;
select bname from borrow group by bname having count(bname)>2;
update deposit set amount=amount+(amount*10)/100;
update deposit set amount=amount+(amount*10)/100 where cname in(select cname from customer where city="Nagpur") and bname in(select bname from branch where city="Bombay");
select cname,sum(amount) from deposit where cname in(select cname from customer where adate>'2004-01-01') group by cname;
select bname,sum(amount) from deposit where amount>4000 group by cname having count(cname)>1;
select cname from deposit where bname in(select bname from deposit where cname="Sunil");  
update branch set bname="xyz" where bname="abc";
update deposit set amount=1000;


