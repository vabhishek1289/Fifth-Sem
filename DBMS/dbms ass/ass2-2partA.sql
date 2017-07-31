create table Emp (eid integer Primary Key,ename varchar(20),age integer,salary_$ integer);
create table Department (did integer Primary Key,dname varchar(20),budjet integer,M_id integer);
create table Works (eid integer,did integer,hrs integer,Primary Key (eid,did),Foreign Key (eid) references Emp(eid),Foreign Key (did) references Department(did));

insert into Emp values('1','Alex Jhonsonss','23','1000000');
insert into Emp values('2','Peter patrick','23','200000');
insert into Emp values('3','Dave m.Roberts','23','300000');
insert into Emp values('4','Bucky Williams','23','400000');
insert into Emp values('5','John wayne','23','500000');
insert into Emp values('6','Mary jacob','23','600000');
insert into Emp values('7','Harry Potter','23','700000');
insert into Emp values('8','Albus Dumbuldore','23','800000');
insert into Emp values('9','Amy watson','23','900000');
insert into Emp values('10','Bear griylls','23','1000000');


insert into Department values('11','Sales','500000','1');
insert into Department values('12','Transport','2000000','2');
insert into Department values('13','Technical','3000000','3');
insert into Department values('14','Import','4000000','4');
insert into Department values('15','Export','6000000','1');

insert into Works values('1','11','8');
insert into Works values('2','12','8');
insert into Works values('3','13','8');
insert into Works values('4','14','8');
insert into Works values('5','15','8');
insert into Works values('6','14','8');
insert into Works values('7','15','8');
insert into Works values('8','13','8');
insert into Works values('9','13','8');
insert into Works values('10','11','8');

select e.ename from Emp e, Works w, Department d where e.eid=w.eid and w.did=d.did and e.salary_$>all(select max(d2.budjet) from Department d2 where d2.did=d.did);
select distinct e.ename from Emp e,Department d where e.eid in(select d.M_id from Department group by d.M_id having min(d.budjet)<5000000 and 1000000<all(select budjet from Department where M_id=d.M_id));
select d.M_id from Department d,Emp e group by d.M_id having sum(d.budjet)>5000000;


select initcap(ename),length(ename) from Emp where ename like 'J%' or ename like 'A%' or ename like 'M%' order by ename;
select (substring_index(ename,' ',-1)) from Emp;
select select length(substring_index(ename,' ',-1)) from Emp;
select concat(ucase(left(ename,1)),right(ename,length(ename)-1)) 'EmpName', length(ename) 'NameLength' from Emp where ename like "J%" or ename like "M%" or ename like "A%" order by EmpName ;
select ename,salary_$,rpad('',salary_$/100000,'*') StarSal from Emp order by salary_$ desc; 








create table SalesPeople(snum integer Primary key,sname varchar(20),city varchar(20),comm integer);
create table Customer(cnum integer Primary key,cname varchar(20),city varchar(20),rating integer,snum integer,Foreign Key (snum) references SalesPeople(snum));
create table Orderss(onum integer Primary key,amt integer,odate date,snum integer,cnum integer, Foreign Key (snum) references SalesPeople(snum),Foreign Key (cnum) references Customer(cnum));

insert into SalesPeople values('1','Alex','Bombay','10');
insert into SalesPeople values('2','Dave','Bombay','5');
insert into SalesPeople values('3','Bucky','Bombay','15');

insert into Customer values('11','Ashok','Bombay','5','1');
insert into Customer values('12','Yuvraj','Bombay','4','2');
insert into Customer values('13','Anand','Bombay','5','3');
insert into Customer values('14','Ashu','Bombay','4','1');
insert into Customer values('15','Deepak','Bombay','4','1');

insert into Orderss values('111','100','2016-08-30','1','11');
insert into Orderss values('112','200','2016-08-29','2','12');
insert into Orderss values('113','300','2016-08-28','3','11');
insert into Orderss values('114','400','2016-08-27','1','12');
insert into Orderss values('115','500','2016-08-26','2','11');
insert into Orderss values('116','600','2016-08-25','3','15');
insert into Orderss values('117','700','2016-08-24','1','12');
insert into Orderss values('118','800','2016-08-23','2','12');
insert into Orderss values('119','900','2016-08-22','3','13');
insert into Orderss values('120','1000','2016-08-21','1','14');

select * from Orderss where cnum=(select cnum from Customer where cname='Ashok');
select cname,city from Customer where rating=(select rating from Customer where cnum=(select cnum from Customer where cname='Yuvraj'));
select rating,cname,cnum from Customer order by rating desc;
select sname,comm from SalesPeople where comm=(select max(comm) from SalesPeople);
select concat(ucase(left(ename,1)),right(ename,length(ename)-1)) 'EmpName', length(ename) 'NameLength' from Emp where ename like "J%" or ename like "M%" or ename like "A%" order by EmpName ;

















