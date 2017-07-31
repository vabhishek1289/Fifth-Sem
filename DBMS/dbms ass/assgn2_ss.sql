/*part a q2*/

create table dept(dept_no integer primary key,dept_name varchar(40));
create table student(rollno integer primary key,s_name varchar(20),f_name varchar(20),m_name varchar(20),dept_no integer,semester integer,f_contact_no varchar(10),gender varchar(6),marks integer,foreign key (dept_no) references dept(dept_no));


insert into dept values (1, 'Electrical');
insert into dept values (2, 'IT');
insert into dept values (3, 'Electronics');
insert into dept values (4, 'Mechanical');
insert into dept values (5, 'Computer');

insert into student values (1, 'Avlokan', 'John', 'Ema','5','3','9876543210','male',20);
insert into student values (2, 'July', 'Shane', 'Maria','3','2','9876543211','female',82);
insert into student values (3, 'Emily', 'Peter', 'Aliyah','2','3','9876543212','male',55);
insert into student values (4, 'Aron', 'John', 'Callie','1','4','9876543213','female',76);
insert into student values (5, 'Amya', 'Alex', 'Britney','5','5','9876543214','male',24);
insert into student values (6, 'Root', 'Shawn', 'Cate','3','3','9876543215','female',31);
insert into student values (7, 'Bucky', 'Ben', 'Daisy','5','6','9876543216','male',45);
insert into student values (8, 'Daina', 'Elvis', 'Jennie','4','7','9876543217','female',66);
insert into student values (9, 'Ellis', 'Gregor', 'Jadyn','3','8','9876543218','male',86);
insert into student values (10, 'Jean', 'Morris', 'Jolie','2','2','9876543219','female',25);
insert into student values (11, 'Neil', 'Neville', 'Karei','1','3','9876543220','male',25);
insert into student values (12, 'Lucy', 'Simon', 'Dora','3','1','9876543211','female',88);
insert into student values (13, 'Dave', 'Tyler', 'Flora','4','3','9876543212','male',90);





select s_name,f_contact_no from student;
select s_name,rollno from student where dept_no=(select dept_no from dept where dept_name="information technology");
select dept_name from dept where dept_no in (select distinct(dept_no) from student);
select dept_no,dept_name from dept;
select count(*) as "numbers" from student where dept_no=(select dept_no from dept where dept_name="Electrical");
select * from student where s_name like "A%";
select *from student where gender="male";
select *from student where semester=3;
select *from student where gender="female" order by s_name;
select s_name,f_name,m_name from student where dept_no=(select dept_no from dept where dept_name="computer");
select s_name,f_contact_no from student where marks<35;
select *from student where s_name like "a%k%n";
select max(marks) from student where dept_no in (select dept_no from dept where dept_name in("computer","mechanical")) group by dept_no;
select avg(marks) from student where dept_no in (select dept_no from dept where dept_name="electronics");
select count(*) from student where marks>35;
