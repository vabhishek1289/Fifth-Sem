create table flights(no int primary key,fro varchar(20),too varchar(20),distance int,departs time,arrives time,price real);
create table aircraft(aid int primary key,aname varchar(20),crurange int);	
create table employees(eid int primary key,ename varchar(20),salary int);
create table certified(eid int,aid int,foreign key(eid) references employees(eid),foreign key(aid) references aircraft(aid),primary key(eid,aid));


insert into flights values('2','Chicago','New Jersey','4000','01:30','09:00','120000');
insert into flights values('3','Hyderabad','LA','700','02:30','03:30','5000');
insert into flights values('4','LA','Australia','3000','09:30','12:00','150000');
insert into flights values('5','LA','Kolkata','1200','04:30','06:30','10000');
insert into flights values('6','LA','Chicago','2000','05:30','07:30','15000');
insert into flights values('7','LA','Honolulu','4000','06:30','11:30','20000');
insert into flights values('17','xyz','abc','8000','06:30','11:30','20000');

insert into aircraft values(11, 'airindia', 4000);
insert into aircraft values(22, 'boeing120', 5000);
insert into aircraft values(33, 'kingfisher', 3000);
insert into aircraft values(44, 'jetairways', 4000);
insert into aircraft values(55, 'boeing240', 6000);
insert into aircraft values(66, 'bharath', 600);
insert into aircraft values(77, 'bharath160', 800); 

insert into employees values(123,'Alex', 80000);
insert into employees values(201,'Peter', 200000);           
insert into employees values(301,'John', 200000);            
insert into employees values(401,'Dave', 60000);
insert into employees values(501,'Bucky', 2000); 
insert into employees values(100,'NonPilot1', 5000); 	
insert into employees values(200,'NonPilot2', 5000000); 	

insert into certified values(123, 11); 
insert into certified values(201, 22);
insert into certified values(201, 33);
insert into certified values(301, 33);
insert into certified values(123, 44);
insert into certified values(401, 44);
insert into certified values(501, 44);
insert into certified values(123, 55);
insert into certified values(123, 66); 

select distinct a.aname from aircraft a,certified c,employees e where a.aid=c.aid and c.eid=e.eid and exists (select * from employees e1 where e1.eid=e.eid and e1.salary>80000); 	
select c.eid, max(a.crurange) from certified c, aircraft a where c.aid  = a.aid group by c.eid having count(*) > 3; 
select distinct e.ename from employees e where e.salary  < ( select min(f.price) from flights f where f.fro= 'LA' and f.too= 'Honolulu'); 
select a.aid, avg (e.salary) from aircraft a, certified  c, employees  e where a.aid = c.aid  and c.eid = e.eid and a.crurange > 1000  group by a.aid, a.aname; 
select distinct e.ename from employees e, certified c, aircraft a where e.eid = c.eid and  c.aid=a.aid and a.aname  like 'boeing%'; 
select a.aid from aircraft a where a.crurange > ( select min(f.distance) from flights f where f.fro='LA' and f.too='Chicago'); 
SELECT DISTINCT F.fro, F.too FROM flights F WHERE EXISTS ( SELECT * FROM employees E WHERE E.salary > 100000 AND  EXISTS (SELECT * FROM aircraft A, certified C WHERE A.crurange >= F.distance AND E.eid = C.eid AND A.aid = C.aid) );
SELECT DISTINCT E.ename FROM employees E WHERE E.eid IN ( SELECT C.eid FROM certified C WHERE EXISTS ( SELECT A.aid FROM aircraft A WHERE A.aid = C.aid AND A.crurange > 3000 ) AND NOT EXISTS ( SELECT A1.aid FROM aircraft A1 WHERE A1.aid = C.aid AND A1.aname LIKE 'Boeing%' ));
SELECT F.departs
           FROM flights F
           WHERE F.no IN 
           ( SELECT F0.no
           FROM flights F0
           WHERE F0.fro = 'LA' AND F0.too = 'New Jersey'
           AND F0.arrives < '18:00' )

           UNION

           ( SELECT F0.no
           FROM flights F0, flights F1
           WHERE F0.fro = 'LA' AND F0.too <> 'New Jersey'
           AND F0.too = F1.fro AND F1.too = 'New Jersey'
           AND F1.departs > F0.arrives
           AND F1.arrives < '18:00' )

           UNION

           ( SELECT F0.no
           FROM flights F0, flights F1, Flights F2
           WHERE F0.fro = 'LA'
           AND F0.too = F1.fro
           AND F1.too = F2.fro
           AND F2.too = 'New Jersey'
           AND F0.too <> 'New Jersey'
           AND F1.too <> 'New Jersey'
           AND F1.departs > F0.arrives
           AND F2.departs > F1.arrives
           AND F2.arrives < '18:00' )

           ;

SELECT Temp2.avg - Temp1.avg FROM (SELECT AVG (E.salary) AS avg FROM employees E WHERE E.eid IN (SELECT DISTINCT C.eid FROM certified C )) AS Temp1,(SELECT AVG (E1.salary) AS avg FROM employees E1 ) AS Temp2;
SELECT E.ename, E.salary FROM employees E WHERE E.eid NOT IN ( SELECT DISTINCT C.eid FROM certified C ) AND E.salary > ( SELECT AVG (E1.salary) FROM employees E1 WHERE E1.eid IN ( SELECT DISTINCT C1.eid FROM certified C1 ) );
SELECT E.ename FROM employees E, certified C, aircraft A WHERE C.aid = A.aid AND E.eid = C.eid and A.aid in(select aid from aircraft where crurange>4000) GROUP BY E.eid, E.ename;





