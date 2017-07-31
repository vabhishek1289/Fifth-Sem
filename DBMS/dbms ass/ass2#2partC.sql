
insert into employee values('1','Alex','23','60000','Delhi','2016-08-01','1');
insert into employee values('2','Peter','23','50000','Bombay','2016-08-01','2');
insert into employee values('3','John','23','25000','Agra','2016-08-01','3');
insert into employee values('4','Dave','23','11000','Nagpur','2016-04-01','2');
insert into employee values('5','Bucky','23','30000','Delhi','2016-05-01','1');
insert into employee values('6','Billy','23','50000','Bombay','2016-08-01','1');
insert into employee values('7','Max','23','20000','Indore','2016-08-01','1');
insert into employee values('8','Alex','23','9000','Bhopal','2016-08-01','1');
insert into employee values('9','Harry','23','10000','Goa','2016-08-01','2');
insert into employee values('10','Blakes','23','40000','Sagar','2016-08-01','3');

insert into dept values('11','CS','Delhi','9000','1');
insert into dept values('12','IT','Bombay','20000','2');
insert into dept values('13','Sales','Indore','40000','1');
insert into dept values('14','Export','Goa','30000','1');
insert into dept values('15','Import','Dewas','60000','3');

insert into workson values('1','11');
insert into workson values('2','12');
insert into workson values('3','13');
insert into workson values('4','12');
insert into workson values('5','11');
insert into workson values('6','11');
insert into workson values('7','11');
insert into workson values('8','11');
insert into workson values('9','12');
insert into workson values('10','13');
insert into workson values('1','12');
insert into workson values('2','11');
insert into workson values('2','13');


insert into project values('111','BootStrap','2016-08-15','2018-12-12');
insert into project values('112','NodeJS','2016-08-10','2018-12-12');
insert into project values('113','Ajax','2016-08-30','2016-12-12');

insert into assign_pro values ('111','1','2016-08-14');
insert into assign_pro values ('111','6','2016-08-14');
insert into assign_pro values ('112','6','2016-08-14');
insert into assign_pro values ('113','6','2016-08-14');
insert into assign_pro values ('111','7','2016-08-14');
insert into assign_pro values ('112','1','2016-08-01');
insert into assign_pro values ('113','1','2016-08-25');

create table employee(eid int, ename varchar(20),age int,salary int,city varchar(20),hierdate date,managerid int,primary key(eid));
create table dept(did int primary key,dname varchar(20),city varchar(20),budjet int,mid int,foreign key (mid) references employee(eid));
create table workson (eid int,did int,foreign key (eid) references employee(eid),foreign key (did) references dept(did));
create table project (pid int primary key,pname varchar(20),startdate date,enddate date);
create table assign_pro (pid int,eid int,assigndate date,foreign key (pid) references project(pid),foreign key (eid) references employee(eid));	

select distinct e1.ename from employee e1,dept d1 where e1.eid=d1.mid and d1.budjet>10000;
select * from employee e,dept d,workson w where e.eid=w.eid and d.did=w.did;
select * from employee cross join workson;
select a.*,b.* from workson a,workson b;
select * from employee natural join workson;
select * from employee inner join workson on employee.eid=workson.eid;
select * from employee left outer join workson on employee.eid=workson.eid;
select * from employee right outer join workson on employee.eid=workson.eid;
select * from employee left join workson on employee.eid=workson.eid union select * from employee right join workson on employee.eid=workson.eid;
select distinct e1.ename from employee e1,dept d1 where e1.eid=d1.mid and d1.budjet=(select max(budjet) from dept);
select distinct e1.eid,e1.ename from employee e1  natural join workson w1 group by w1.eid having count(w1.eid)>=2; 
select e1.ename "Employee",e2.ename "Manager" from employee e1 join employee e2 on e1.managerid=e2.eid;
select e.ename from employee e,dept d where e.city=d.city;
select p.pid,p.pname,count(a.eid) from project p natural join assign_pro a group by a.pid having count(a.eid)>2; 
select did,dname,(select count(*) from employee natural join workson where salary>4000 and did=d.did) as noEmp from dept d where did in(select did from workson group by did having count(*)>5);
select e1.ename "Employee" from employee e1 join employee e2 on e2.eid=e1.managerid where e1.salary<e2.salary;
select distinct e.ename from employee e join assign_pro a where e.eid=a.eid and a.pid in(select distinct p1.pid from project p1 join assign_pro a1 on p1.pid=a1.pid where datediff(p1.enddate,p1.startdate)>730);
select ename from employee e where not exists(select pid from project where pid not in(select pid from assign_pro where eid=e.eid));
select * from employee where exists(select eid from workson where did is not null);
select e1.ename "Employee",e1.hierdate "Emp_date",e2.ename "Manager",e2.hierdate "Mgr_date" from employee e1 join employee e2 on e2.eid=e1.managerid where e1.hierdate<e2.hierdate;
select ename,age from employee where eid in(select w.eid from workson w join dept d on w.did=d.did where d.dname='CS' or d.dname='IT'); 
select salary from employee order by salary desc limit (N-1),1;
select ename,salary from employee where length(salary)=5;
select * from employee where exists(select eid from workson where did is null);
select *from employee order by hierdate desc limit 1;
select distinct e1.ename,e1.eid from employee e1,employee e2 where e1.eid!=e2.eid and e1.ename=e2.ename;
select ename,max(salary) from employee where eid in(select w.eid from workson w,dept d where w.did=d.did and d.dname='CS');
select distinct e.ename,d.dname from employee e,dept d group by d.mid having count(d.mid)>=3;
select e.ename from employee e join workson w where e.eid=w.eid group by w.eid having count(w.eid)=2;
select dname from dept d ,workson w where w.did=d.did group by dname order by count(eid) desc limit 1;
select * from employee e1 where eid in (select eid from workson group by eid having count(*)>=2)and eid in (select eid from assign_pro group by eid having count(*)>=2);
select e1.ename,e1.salary from employee e1 cross join employee e2 where e1.eid=e2.eid order by e2.salary desc limit 0,3;
select distinct e.eid,e.ename,e.salary,e.managerid from (employee e,workson w),dept d9 where e.eid in(select eid from workson where did in(select did from dept where city="Delhi" or city="Goa")) and datediff(date(curdate()),e.hierdate)>60 ;
select e2.* from employee e1,employee e2 where e1.ename='Blakes' and e2.salary>e1.salary;
