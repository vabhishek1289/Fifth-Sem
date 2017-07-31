create table Deptt(deptno integer PRIMARY KEY,dept_name varchar(20));
create table Employee(eid integer PRIMARY KEY,ename varchar(20),dob date,joining_date date,salary integer,designation varchar(20),deptno integer,FOREIGN KEY (deptno) references Deptt(deptno));

insert into Deptt values('10','Sales');
insert into Deptt values('20','Transport');
insert into Deptt values('30','Technical');
insert into Deptt values('40','Import');
insert into Deptt values('50','Export');

insert into Employee values('1','Alex','1965-01-01','1983-5-20','2555','Executive','10');
insert into Employee values('2','Dale','1965-02-02','1984-5-22','3000','Executive','10');
insert into Employee values('3','Peter','1965-03-03','1983-8-14','5000','CEO','10');
insert into Employee values('4','John','1965-04-04','1984-8-10','30555','Executive','10');
insert into Employee values('5','Dave','1970-05-05','2002-12-13','5000','Manager','20');
insert into Employee values('6','Bucky','1970-06-06','2016-08-23','4700','MR','30');
insert into Employee values('7','Roberts','1970-07-07','2016-08-25','6655','Manager','40');
insert into Employee values('8','Mary','1970-08-08','2000-10-02','20000','MR','40');
insert into Employee values('9','Patrick','1970-09-09','2013-10-23','50000','Salesman','40');
insert into Employee values('10','Harry','1970-10-10','2014-12-25','10000','Salesman','40');
insert into Employee values('11','Albus','1970-11-11','2015-01-01','25000','Manager','30');

select ename,joining_date from Employee e where month(joining_date) in(select month(joining_date) from Employee e1 where e1.eid!=e.eid) order by month(joining_date);
2...select substr(lower(ename),1,10)||substr(upper(ename),10,length(ename)) from Employee; 
select count(*) from Employee where designation="Manager";
4...
select dept_name from Deptt order by deptno;
select dept_name from Deptt where deptno not in (select deptno from Employee);
7...select max(salary),deptno from Employee where sum(salary)=() group by deptno;
select deptno,avg(salary) from Employee group by deptno;
select deptno,count(*) from Employee group by deptno having count(deptno)>3; 
select * from Employee where (salary%2)!=0;
select ename from Employee where month(joining_date)=12;
select ename from Employee where ename like '%a%';
select Employee.ename from Employee,Employee e where Employee.salary=e.deptno;
select ename,salary from Employee where (salary*10)/100=year(joining_date);
select ename,joining_date from Employee where day(joining_date)<15;
delete from Employee where year(joining_date)<year(curdate())-10;
select ename,designation from Employee where designation='Manager';
select ename,joining_date from Employee where year(curdate())-year(joining_date)>4; 
select ename,joining_date from Employee where day(joining_date)>(day(curdate())-7) and year(joining_date)=year(curdate()); 
select ename,salary from Employee where deptno=30 and salary>(select min(salary) from Employee where deptno=30);
select ename,salary from Employee where deptno=30 having salary=(select max(salary) from Employee where deptno=30);
22...select e1.ename,e1.joining_date,e1.designation from Employee e1,Employee e2 where (e1.joining_date and e1.designation='Manager')<(e2.joining_date and e2.designation!='Manager') group by e1.joining_date;
select ename,designation,max(salary) from Employee group by designation order by max(salary) desc;
select ename,joining_date,deptno from Employee where joining_date in(select max(joining_date) from Employee group by deptno) group by deptno;
select * from Employee e where salary>(select avg(salary) from Employee e1 where e.deptno=e1.deptno group by e1.deptno);