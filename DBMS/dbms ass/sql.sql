create table product (p_no int primary key, p_name varchar(40), p_sell_price int , p_mfd varchar(40));
create table client (c_no varchar(8) primary key, c_name varchar(40), c_add varchar(40), c_city varchar(20), c_pin int(6), c_state varchar(20),total_bal int);
create table p_order (o_no int primary key, o_date date,c_no varchar(8),s_no varchar(8) unique key,bill_status varchar(20),o_drly_dt date,foreign key(c_no) references client (c_no),FOREIGN KEY (s_no) REFERENCES salesman(s_no));
create table salesman (s_no varchar(8) primary key, s_name varchar(40),s_add varchar(40),s_city varchar(20),s_pin int(6), s_state varchar(20),s_salary int,s_drly_dt date,s_qod int,prod_rate int);
insert into client values ("CN01001","Abhishek Verma","Mani Road","Dewas",455001,"MP",12000);
insert into client values ("CN01002","Saransh","Main Road","Satna",458001,"MP",10000);
insert into client values ("CN01003","Srajan","7359 Young Ave","Fort Worth",76110,"TX",10000);
insert into client values ("CN01004","Obama","White House","Washington DC",11001,"WS",10000);
insert into client values ("CN01005","Aditya","871 Buckingham Lane","Upper Marlboro",20772,"MD",10000);

insert into salesman values ("SN01005","Andrea","71 Buham Lane","Marlboro",21772,"MD",1000,"2015-12-12",12,200);
insert into salesman values ("SN01001","Crea","Yang EVE","Ranchester",15158,"NY",2000,"2016-07-10",10,100);
insert into salesman values ("SN01003","Agustus","Everset st","Ranchester",15158,"NY",2100,"2016-07-11",5,400);
insert into salesman values ("SN01002","Audria","NorthEVE st","North Island",10158,"NY",2100,"2016-07-01",5,300);
insert into salesman values ("SN01004","Lia","Yan st","North Island",10158,"NY",2100,"2016-07-05",1,300);

insert into product (p_no, p_name, p_sell_price, p_mfd) values (1, 'Namfix', 493, 'Wikivu');
insert into product (p_no, p_name, p_sell_price, p_mfd) values (2, 'Regrant', 374, 'Kimia');
insert into product (p_no, p_name, p_sell_price, p_mfd) values (3, 'Subin', 164, 'Mybuzz');
insert into product (p_no, p_name, p_sell_price, p_mfd) values (4, 'Ronstring', 656, 'Skibox');
insert into product (p_no, p_name, p_sell_price, p_mfd) values (5, 'Job', 203, 'Yakitri');
insert into product (p_no, p_name, p_sell_price, p_mfd) values (6, 'Holdlamis', 738, 'Buzzster');
insert into product (p_no, p_name, p_sell_price, p_mfd) values (7, 'Regrant', 656, 'Oozz');
insert into product (p_no, p_name, p_sell_price, p_mfd) values (8, 'Zaam-Dox', 623, 'Skippad');
insert into product (p_no, p_name, p_sell_price, p_mfd) values (9, 'Kanlam', 118, 'Kazio');
insert into product (p_no, p_name, p_sell_price, p_mfd) values (10, 'Latlux', 789, 'Topicshots');
insert into product (p_no, p_name, p_sell_price, p_mfd) values (11, 'Sonsing', 764, 'Brainlounge');
insert into product (p_no, p_name, p_sell_price, p_mfd) values (12, 'Fix San', 644, 'Eadel');
insert into product (p_no, p_name, p_sell_price, p_mfd) values (13, 'Kanlam', 417, 'Pixoboo');
insert into product (p_no, p_name, p_sell_price, p_mfd) values (14, 'Stronghold', 793, 'Meezzy');
insert into product (p_no, p_name, p_sell_price, p_mfd) values (15, 'Konklux', 512, 'Oyoba');


insert into p_order (o_no, o_date, c_no, s_no, bill_status, o_drly_dt) values (1, '2015-10-17', 'CN01001', 'SN01001', 'Yes', '2015-10-26');
insert into p_order (o_no, o_date, c_no, s_no, bill_status, o_drly_dt) values (2, '2012-10-15', 'CN01002', 'SN01003', 'Yes', '2012-10-22');
insert into p_order (o_no, o_date, c_no, s_no, bill_status, o_drly_dt) values (3, '2016-07-20', 'CN01003', 'SN01002', 'No', '2016-07-23');
insert into p_order (o_no, o_date, c_no, s_no, bill_status, o_drly_dt) values (4, '2008-11-06', 'CN01005', 'SN01004', 'Yes', '2008-11-12');
insert into p_order (o_no, o_date, c_no, s_no, bill_status, o_drly_dt) values (5, '2008-12-20', 'CN01004', 'SN01005', 'No', '2008-12-22');



/* PART ASSIGNMENT 2 OTHER PART */ 

create table Student(rollno int primary key,s_name varchar(20),f_name varchar(20),m_name varchar(20),dept_no int,semester int,f_contact_no varchar(10),gender char,marks int(3));

create table Dept(dept_no int primary key, dept_name varchar(50));

insert into Student (rollno, s_name, f_name, m_name, dept_no, semester, f_contact_no, gender, marks) values (1, 'Elizabeth', 'Lynch', 'Kathy', 3, 4, '86-(289)129-8857', 'F', 140);
insert into Student (rollno, s_name, f_name, m_name, dept_no, semester, f_contact_no, gender, marks) values (2, 'Eric', 'Nichols', 'Eric', 1, 7, '374-(273)625-1365', 'M', 347);
insert into Student (rollno, s_name, f_name, m_name, dept_no, semester, f_contact_no, gender, marks) values (3, 'Randy', 'Payne', 'Bobby', 5, 4, '261-(318)455-3472', 'M', 443);
insert into Student (rollno, s_name, f_name, m_name, dept_no, semester, f_contact_no, gender, marks) values (4, 'Brenda', 'Shaw', 'Jane', 7, 1, '380-(110)794-8462', 'F', 4);
insert into Student (rollno, s_name, f_name, m_name, dept_no, semester, f_contact_no, gender, marks) values (5, 'Amy', 'Hawkins', 'Heather', 7, 5, '62-(116)982-1938', 'F', 325);
insert into Student (rollno, s_name, f_name, m_name, dept_no, semester, f_contact_no, gender, marks) values (6, 'George', 'Wilson', 'William', 5, 1, '250-(402)388-9194', 'M', 318);
insert into Student (rollno, s_name, f_name, m_name, dept_no, semester, f_contact_no, gender, marks) values (7, 'Wayne', 'Bailey', 'Frank', 7, 1, '86-(604)984-4657', 'M', 105);
insert into Student (rollno, s_name, f_name, m_name, dept_no, semester, f_contact_no, gender, marks) values (8, 'Samuel', 'Hudson', 'Carlos', 3, 6, '33-(160)857-3042', 'M', 281);
insert into Student (rollno, s_name, f_name, m_name, dept_no, semester, f_contact_no, gender, marks) values (9, 'Nicole', 'Franklin', 'Christine', 2, 6, '57-(767)838-8856', 'F', 107);
insert into Student (rollno, s_name, f_name, m_name, dept_no, semester, f_contact_no, gender, marks) values (10, 'Albert', 'Hamilton', 'William', 1, 3, '504-(536)935-2158', 'M', 200);

insert into Dept (dept_no, dept_name) values (1, 'ComputerEngg');
insert into Dept (dept_no, dept_name) values (2, 'ElectricalEngg');
insert into Dept (dept_no, dept_name) values (3, 'ElectronicsEngg');
insert into Dept (dept_no, dept_name) values (4, 'MechanicalEngg');
insert into Dept (dept_no, dept_name) values (5, 'IndustrialProdEngg');
insert into Dept (dept_no, dept_name) values (6, 'InformationTechnoEngg');
insert into Dept (dept_no, dept_name) values (7, 'Pharmacy');


