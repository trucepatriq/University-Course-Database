CREATE DATABASE fupre CHARACTER SET UTF8;
USE fupre;

CREATE TABLE course (
	course_id int not null auto_increment,
	course_name varchar(100),
    duration varchar(10),
    college_id enum('COS', 'COT', 'PGS'),
    degree_id varchar(5),
    prog_id enum('UG', 'PG'),
    dept_id int,
    primary key (course_id)
);
create table department (
	dept_id int not null auto_increment,
    dept_name varchar(60),
    college_id enum('COS', 'COT', 'PGS'),
    primary key (dept_id)
);
create table college (
	college_id enum('COS', 'COT', 'PGS'),
    college_name varchar(50),
    primary key (college_id)
);
create table programme (
	prog_id enum('UG', 'PG'),
    prog_name varchar(20),
    primary key (prog_id)
);
create table degree (
	degree_id varchar(5),
    degree_name varchar(30),
    prog_id enum('UG', 'PG'),
    college_id enum('COS', 'COT', 'PGS'),
    primary key (degree_id)
);

alter table course
	add constraint courses_department_fk
    foreign key (dept_id)
    references department (dept_id);

alter table course
	add constraint courses_college_fk
    foreign key (college_id)
    references college (college_id);

alter table course
	add constraint courses_degree_fk
    foreign key (degree_id)
    references degree (degree_id);

alter table course
	add constraint courses_programme_fk
    foreign key (prog_id)
    references programme (prog_id);

alter table department
	add constraint department_college_fk
    foreign key (college_id)
    references college (college_id);

alter table degree
	add constraint degree_programme_fk
    foreign key (prog_id)
    references programme (prog_id);

alter table degree
	add constraint degree_college_fk
    foreign key (college_id)
    references college (college_id);


insert into college (college_id, college_name)
values ('COS', 'College of Science');
insert into college (college_id, college_name)
values ('COT', 'College of Technology');
insert into college (college_id, college_name)
values ('PGS', 'Post Graduate Studies');

insert into programme (prog_id, prog_name)
values ('UG', 'Undergraduate');
insert into programme (prog_id, prog_name)
values ('PG', 'Postgraduate');

insert into department (dept_id, dept_name, college_id)
values (null, 'Department of Chemistry', 
	(select college_id from college where college_name = 'College of Science'));
insert into department (dept_id, dept_name, college_id)
values (null, 'Department of Earth Sciences',
	(select college_id from college where college_name = 'College of Science'));    
insert into department (dept_id, dept_name, college_id)
values (null, 'Department of Environmental Management and Toxicology',
	(select college_id from college where college_name = 'College of Science'));
insert into department (dept_id, dept_name, college_id)
values (null, 'Department of Mathematics and Computer Science',
	(select college_id from college where college_name = 'College of Science'));  
insert into department (dept_id, dept_name, college_id)
values (null, 'Department of Physics',
	(select college_id from college where college_name = 'College of Science'));
insert into department (dept_id, dept_name, college_id)
values (null, 'Department of Chemical Engineering',
	(select college_id from college where college_name = 'College of Technology'));
insert into department (dept_id, dept_name, college_id)
values (null, 'Department of Electrical and Electronics Engineering',
	(select college_id from college where college_name = 'College of Technology'));
insert into department (dept_id, dept_name, college_id)
values (null, 'Department of Marine Engineering',
	(select college_id from college where college_name = 'College of Technology'));
insert into department (dept_id, dept_name, college_id)
values (null, 'Department of Mechanical Engineering',
	(select college_id from college where college_name = 'College of Technology'));
insert into department (dept_id, dept_name, college_id)
values (null, 'Department of Petroleum Engineering',
	(select college_id from college where college_name = 'College of Technology'));
    
insert into degree (degree_id, degree_name, prog_id, college_id)
values ('BSc', 'Bachelor of Science',
	(select prog_id from programme where prog_name = 'Undergraduate'),
	(select college_id from college where college_name = 'College of Science'));
insert into degree (degree_id, degree_name, prog_id, college_id)
values ('B.Eng', 'Bachelor of Engineering',
	(select prog_id from programme where prog_name = 'Undergraduate'),
	(select college_id from college where college_name = 'College of Technology'));
insert into degree (degree_id, degree_name, prog_id, college_id)
values ('PGD', 'Post Graduate Diploma',
	(select prog_id from programme where prog_name = 'Postgraduate'),
	(select college_id from college where college_name = 'Post Graduate Studies'));
insert into degree (degree_id, degree_name, prog_id, college_id)
values ('MSc', 'Master of Science',
	(select prog_id from programme where prog_name = 'Postgraduate'),
	(select college_id from college where college_name = 'College of Science'));
insert into degree (degree_id, degree_name, prog_id, college_id)
values ('M.Eng', 'Master of Engineering',
	(select prog_id from programme where prog_name = 'Postgraduate'),
	(select college_id from college where college_name = 'College of Technology'));
insert into degree (degree_id, degree_name, prog_id, college_id)
values ('PhD', 'Doctor of Philosophy',
	(select prog_id from programme where prog_name = 'Postgraduate'),
	(select college_id from college where college_name = 'Post Graduate Studies'));
    
insert into course (course_id, course_name, duration, college_id, degree_id, prog_id, dept_id)
values (null, 'Pure Chemistry', '4 Years', 
	(select college_id from college where college_name = 'College of Science'),
    (select degree_id from degree where degree_name = 'Bachelor of Science'),
    (select prog_id from programme where prog_name = 'Undergraduate'),
    (select dept_id from department where dept_name = 'Department of Chemistry'));
insert into course (course_id, course_name, duration, college_id, degree_id, prog_id, dept_id)
values (null, 'Industrial Chemistry', '4 Years',
	(select college_id from college where college_name = 'College of Science'),
    (select degree_id from degree where degree_name = 'Bachelor of Science'),
    (select prog_id from programme where prog_name = 'Undergraduate'),
    (select dept_id from department where dept_name = 'Department of Chemistry'));
insert into course (course_id, course_name, duration, college_id, degree_id, prog_id, dept_id)
values (null, 'Environmental Management and Toxicology', '5 Years',
	(select college_id from college where college_name = 'College of Science'),
    (select degree_id from degree where degree_name = 'Bachelor of Science'),
    (select prog_id from programme where prog_name = 'Undergraduate'),
    (select dept_id from department where dept_name = 'Department of Environmental Management and Toxicology'));
insert into course (course_id, course_name, duration, college_id, degree_id, prog_id, dept_id)
values (null, 'Mathematics', '4 Years', 
	(select college_id from college where college_name = 'College of Science'),
    (select degree_id from degree where degree_name = 'Bachelor of Science'),
    (select prog_id from programme where prog_name = 'Undergraduate'),
    (select dept_id from department where dept_name = 'Department of Mathematics and Computer Science'));
insert into course (course_id, course_name, duration, college_id, degree_id, prog_id, dept_id)
values (null, 'Computer Science', '4 Years',
	(select college_id from college where college_name = 'College of Science'),
    (select degree_id from degree where degree_name = 'Bachelor of Science'),
    (select prog_id from programme where prog_name = 'Undergraduate'),
    (select dept_id from department where dept_name = 'Department of Mathematics and Computer Science'));
insert into course (course_id, course_name, duration, college_id, degree_id, prog_id, dept_id)
values (null, 'Geology', '4 Years', 
	(select college_id from college where college_name = 'College of Science'),
    (select degree_id from degree where degree_name = 'Bachelor of Science'),
    (select prog_id from programme where prog_name = 'Undergraduate'),
    (select dept_id from department where dept_name = 'Department of Earth Sciences'));
insert into course (course_id, course_name, duration, college_id, degree_id, prog_id, dept_id)
values (null, 'Geophysics', '4 Years',
	(select college_id from college where college_name = 'College of Science'),
    (select degree_id from degree where degree_name = 'Bachelor of Science'),
    (select prog_id from programme where prog_name = 'Undergraduate'),
    (select dept_id from department where dept_name = 'Department of Earth Sciences'));
insert into course (course_id, course_name, duration, college_id, degree_id, prog_id, dept_id)
values (null, 'Physics', '4 Years', 
	(select college_id from college where college_name = 'College of Science'),
    (select degree_id from degree where degree_name = 'Bachelor of Science'),
    (select prog_id from programme where prog_name = 'Undergraduate'),
    (select dept_id from department where dept_name = 'Department of Physics'));
insert into course (course_id, course_name, duration, college_id, degree_id, prog_id, dept_id)
values (null, 'Chemical Engineering', '5 Years',
	(select college_id from college where college_name = 'College of Technology'),
    (select degree_id from degree where degree_name = 'Bachelor of Engineering'),
    (select prog_id from programme where prog_name = 'Undergraduate'),
    (select dept_id from department where dept_name = 'Department of Chemical Engineering'));
insert into course (course_id, course_name, duration, college_id, degree_id, prog_id, dept_id)
values (null, 'Electrical and Electronics Engineering', '5 Years',
	(select college_id from college where college_name = 'College of Technology'),
    (select degree_id from degree where degree_name = 'Bachelor of Engineering'),
    (select prog_id from programme where prog_name = 'Undergraduate'),
    (select dept_id from department where dept_name = 'Department of Electrical and Electronics Engineering'));
insert into course (course_id, course_name, duration, college_id, degree_id, prog_id, dept_id)
values (null, 'Marine Engineering', '5 Years',
	(select college_id from college where college_name = 'College of Technology'),
    (select degree_id from degree where degree_name = 'Bachelor of Engineering'),
    (select prog_id from programme where prog_name = 'Undergraduate'),
    (select dept_id from department where dept_name = 'Department of Marine Engineering'));
insert into course (course_id, course_name, duration, college_id, degree_id, prog_id, dept_id)
values (null, 'Mechanical Engineering', '5 Years',
	(select college_id from college where college_name = 'College of Technology'),
    (select degree_id from degree where degree_name = 'Bachelor of Engineering'),
    (select prog_id from programme where prog_name = 'Undergraduate'),
    (select dept_id from department where dept_name = 'Department of Mechanical Engineering'));
insert into course (course_id, course_name, duration, college_id, degree_id, prog_id, dept_id)
values (null, 'Petroleum Engineering', '5 Years',
	(select college_id from college where college_name = 'College of Technology'),
    (select degree_id from degree where degree_name = 'Bachelor of Engineering'),
    (select prog_id from programme where prog_name = 'Undergraduate'),
    (select dept_id from department where dept_name = 'Department of Petroleum Engineering'));
insert into course (course_id, course_name, duration, college_id, degree_id, prog_id, dept_id)
values (null, 'Chemistry', '1 Year',
	(select college_id from college where college_name = 'Post Graduate Studies'),
    (select degree_id from degree where degree_name = 'Post Graduate Diploma'),
    (select prog_id from programme where prog_name = 'Postgraduate'),
    (select dept_id from department where dept_name = 'Department of Chemistry'));
insert into course (course_id, course_name, duration, college_id, degree_id, prog_id, dept_id)
values (null, 'Analytical Chemistry', '2 Years',
	(select college_id from college where college_name = 'College of Science'),
    (select degree_id from degree where degree_name = 'Master of Science'),
    (select prog_id from programme where prog_name = 'Postgraduate'),
    (select dept_id from department where dept_name = 'Department of Chemistry'));
insert into course (course_id, course_name, duration, college_id, degree_id, prog_id, dept_id)
values (null, 'Environmental Chemistry', '2 Years',
	(select college_id from college where college_name = 'College of Science'),
    (select degree_id from degree where degree_name = 'Master of Science'),
    (select prog_id from programme where prog_name = 'Postgraduate'),
    (select dept_id from department where dept_name = 'Department of Chemistry'));
    insert into course (course_id, course_name, duration, college_id, degree_id, prog_id, dept_id)
values (null, 'Industrial Chemistry', '2 Years',
	(select college_id from college where college_name = 'College of Science'),
    (select degree_id from degree where degree_name = 'Master of Science'),
    (select prog_id from programme where prog_name = 'Postgraduate'),
    (select dept_id from department where dept_name = 'Department of Chemistry'));
insert into course (course_id, course_name, duration, college_id, degree_id, prog_id, dept_id)
values (null, 'Petroleum Chemistry', '2 Years',
	(select college_id from college where college_name = 'College of Science'),
    (select degree_id from degree where degree_name = 'Master of Science'),
    (select prog_id from programme where prog_name = 'Postgraduate'),
    (select dept_id from department where dept_name = 'Department of Chemistry'));
insert into course (course_id, course_name, duration, college_id, degree_id, prog_id, dept_id)
values (null, 'Analytical Chemistry', '5 Years',
	(select college_id from college where college_name = 'College of Science'),
    (select degree_id from degree where degree_name = 'Doctor of Philosophy'),
    (select prog_id from programme where prog_name = 'Postgraduate'),
    (select dept_id from department where dept_name = 'Department of Chemistry'));
insert into course (course_id, course_name, duration, college_id, degree_id, prog_id, dept_id)
values (null, 'Environmental Chemistry/Pollution control', '5 Years',
	(select college_id from college where college_name = 'College of Science'),
    (select degree_id from degree where degree_name = 'Doctor of Philosophy'),
    (select prog_id from programme where prog_name = 'Postgraduate'),
    (select dept_id from department where dept_name = 'Department of Chemistry'));
insert into course (course_id, course_name, duration, college_id, degree_id, prog_id, dept_id)
values (null, 'Inorganic Chemistry', '5 Years',
	(select college_id from college where college_name = 'College of Science'),
    (select degree_id from degree where degree_name = 'Doctor of Philosophy'),
    (select prog_id from programme where prog_name = 'Postgraduate'),
    (select dept_id from department where dept_name = 'Department of Chemistry'));
insert into course (course_id, course_name, duration, college_id, degree_id, prog_id, dept_id)
values (null, 'Physical Chemistry', '5 Years',
	(select college_id from college where college_name = 'College of Science'),
    (select degree_id from degree where degree_name = 'Doctor of Philosophy'),
    (select prog_id from programme where prog_name = 'Postgraduate'),
    (select dept_id from department where dept_name = 'Department of Chemistry'));
insert into course (course_id, course_name, duration, college_id, degree_id, prog_id, dept_id)
values (null, 'Organic/Natural Product Chemistry', '5 Years',
	(select college_id from college where college_name = 'College of Science'),
    (select degree_id from degree where degree_name = 'Doctor of Philosophy'),
    (select prog_id from programme where prog_name = 'Postgraduate'),
    (select dept_id from department where dept_name = 'Department of Chemistry'));
insert into course (course_id, course_name, duration, college_id, degree_id, prog_id, dept_id)
values (null, 'Geology', '1 Year',
	(select college_id from college where college_name = 'College of Science'),
    (select degree_id from degree where degree_name = 'Post Graduate Diploma'),
    (select prog_id from programme where prog_name = 'Postgraduate'),
    (select dept_id from department where dept_name = 'Department of Earth Sciences'));
insert into course (course_id, course_name, duration, college_id, degree_id, prog_id, dept_id)
values (null, 'Geophysics', '1 Year',
	(select college_id from college where college_name = 'College of Science'),
    (select degree_id from degree where degree_name = 'Post Graduate Diploma'),
    (select prog_id from programme where prog_name = 'Postgraduate'),
    (select dept_id from department where dept_name = 'Department of Earth Sciences'));
insert into course (course_id, course_name, duration, college_id, degree_id, prog_id, dept_id)
values (null, 'Petroleum Geoscience', '2 Years',
	(select college_id from college where college_name = 'College of Science'),
    (select degree_id from degree where degree_name = 'Master of Science'),
    (select prog_id from programme where prog_name = 'Postgraduate'),
    (select dept_id from department where dept_name = 'Department of Earth Sciences'));
insert into course (course_id, course_name, duration, college_id, degree_id, prog_id, dept_id)
values (null, 'Environmental Geoscience', '2 Years',
	(select college_id from college where college_name = 'College of Science'),
    (select degree_id from degree where degree_name = 'Master of Science'),
    (select prog_id from programme where prog_name = 'Postgraduate'),
    (select dept_id from department where dept_name = 'Department of Earth Sciences'));
insert into course (course_id, course_name, duration, college_id, degree_id, prog_id, dept_id)
values (null, 'Petroleum Geophysics', '2 Years',
	(select college_id from college where college_name = 'College of Science'),
    (select degree_id from degree where degree_name = 'Master of Science'),
    (select prog_id from programme where prog_name = 'Postgraduate'),
    (select dept_id from department where dept_name = 'Department of Earth Sciences'));
insert into course (course_id, course_name, duration, college_id, degree_id, prog_id, dept_id)
values (null, 'Exploration Geophysics', '2 Years',
	(select college_id from college where college_name = 'College of Science'),
    (select degree_id from degree where degree_name = 'Master of Science'),
    (select prog_id from programme where prog_name = 'Postgraduate'),
    (select dept_id from department where dept_name = 'Department of Earth Sciences'));
insert into course (course_id, course_name, duration, college_id, degree_id, prog_id, dept_id)
values (null, 'Geology', '5 Years',
	(select college_id from college where college_name = 'College of Science'),
    (select degree_id from degree where degree_name = 'Doctor of Philosophy'),
    (select prog_id from programme where prog_name = 'Postgraduate'),
    (select dept_id from department where dept_name = 'Department of Earth Sciences'));
insert into course (course_id, course_name, duration, college_id, degree_id, prog_id, dept_id)
values (null, 'Geophysics', '5 Years',
	(select college_id from college where college_name = 'College of Science'),
    (select degree_id from degree where degree_name = 'Doctor of Philosophy'),
    (select prog_id from programme where prog_name = 'Postgraduate'),
    (select dept_id from department where dept_name = 'Department of Earth Sciences'));
insert into course (course_id, course_name, duration, college_id, degree_id, prog_id, dept_id)
values (null, 'Waste Management', '1 Year',
	(select college_id from college where college_name = 'College of Science'),
    (select degree_id from degree where degree_name = 'Post Graduate Diploma'),
    (select prog_id from programme where prog_name = 'Postgraduate'),
    (select dept_id from department where dept_name = 'Department of Environmental Management and Toxicology'));
insert into course (course_id, course_name, duration, college_id, degree_id, prog_id, dept_id)
values (null, 'Environmental Toxicology and Public Health', '1 Year',
	(select college_id from college where college_name = 'College of Science'),
    (select degree_id from degree where degree_name = 'Post Graduate Diploma'),
    (select prog_id from programme where prog_name = 'Postgraduate'),
    (select dept_id from department where dept_name = 'Department of Environmental Management and Toxicology'));
insert into course (course_id, course_name, duration, college_id, degree_id, prog_id, dept_id)
values (null, 'Environmental Pollution and Control', '2 Years',
	(select college_id from college where college_name = 'College of Science'),
    (select degree_id from degree where degree_name = 'Master of Science'),
    (select prog_id from programme where prog_name = 'Postgraduate'),
    (select dept_id from department where dept_name = 'Department of Environmental Management and Toxicology'));
insert into course (course_id, course_name, duration, college_id, degree_id, prog_id, dept_id)
values (null, 'Geo-Informatics', '2 Years',
	(select college_id from college where college_name = 'College of Science'),
    (select degree_id from degree where degree_name = 'Master of Science'),
    (select prog_id from programme where prog_name = 'Postgraduate'),
    (select dept_id from department where dept_name = 'Department of Environmental Management and Toxicology'));
insert into course (course_id, course_name, duration, college_id, degree_id, prog_id, dept_id)
values (null, 'Health, Environment, Safety and Security', '2 Years',
	(select college_id from college where college_name = 'College of Science'),
    (select degree_id from degree where degree_name = 'Master of Science'),
    (select prog_id from programme where prog_name = 'Postgraduate'),
    (select dept_id from department where dept_name = 'Department of Environmental Management and Toxicology'));
insert into course (course_id, course_name, duration, college_id, degree_id, prog_id, dept_id)
values (null, 'Environmental Toxicology', '5 Years',
	(select college_id from college where college_name = 'College of Science'),
    (select degree_id from degree where degree_name = 'Doctor of Philosophy'),
    (select prog_id from programme where prog_name = 'Postgraduate'),
    (select dept_id from department where dept_name = 'Department of Environmental Management and Toxicology'));
insert into course (course_id, course_name, duration, college_id, degree_id, prog_id, dept_id)
values (null, 'Geo-Informatics', '5 Years',
	(select college_id from college where college_name = 'College of Science'),
    (select degree_id from degree where degree_name = 'Doctor of Philosophy'),
    (select prog_id from programme where prog_name = 'Postgraduate'),
    (select dept_id from department where dept_name = 'Department of Environmental Management and Toxicology'));
    insert into course (course_id, course_name, duration, college_id, degree_id, prog_id, dept_id)
values (null, 'Health, Environment, Safety and Security', '5 Years',
	(select college_id from college where college_name = 'College of Science'),
    (select degree_id from degree where degree_name = 'Doctor of Philosophy'),
    (select prog_id from programme where prog_name = 'Postgraduate'),
    (select dept_id from department where dept_name = 'Department of Environmental Management and Toxicology'));
insert into course (course_id, course_name, duration, college_id, degree_id, prog_id, dept_id)
values (null, 'Petroleum and Environmental Microbiology', '5 Years',
	(select college_id from college where college_name = 'College of Science'),
    (select degree_id from degree where degree_name = 'Doctor of Philosophy'),
    (select prog_id from programme where prog_name = 'Postgraduate'),
    (select dept_id from department where dept_name = 'Department of Environmental Management and Toxicology'));
insert into course (course_id, course_name, duration, college_id, degree_id, prog_id, dept_id)
values (null, 'Environmental Pollution and Control', '5 Years',
	(select college_id from college where college_name = 'College of Science'),
    (select degree_id from degree where degree_name = 'Doctor of Philosophy'),
    (select prog_id from programme where prog_name = 'Postgraduate'),
    (select dept_id from department where dept_name = 'Department of Environmental Management and Toxicology'));
insert into course (course_id, course_name, duration, college_id, degree_id, prog_id, dept_id)
values (null, 'Computer Science', '1 Year',
	(select college_id from college where college_name = 'College of Science'),
    (select degree_id from degree where degree_name = 'Post Graduate Diploma'),
    (select prog_id from programme where prog_name = 'Postgraduate'),
    (select dept_id from department where dept_name = 'Department of Mathematics and Computer Science'));
insert into course (course_id, course_name, duration, college_id, degree_id, prog_id, dept_id)
values (null, 'Mathematics', '1 Year',
	(select college_id from college where college_name = 'College of Science'),
    (select degree_id from degree where degree_name = 'Post Graduate Diploma'),
    (select prog_id from programme where prog_name = 'Postgraduate'),
    (select dept_id from department where dept_name = 'Department of Mathematics and Computer Science'));
insert into course (course_id, course_name, duration, college_id, degree_id, prog_id, dept_id)
values (null, 'Computer Science', '2 Years',
	(select college_id from college where college_name = 'College of Science'),
    (select degree_id from degree where degree_name = 'Master of Science'),
    (select prog_id from programme where prog_name = 'Postgraduate'),
    (select dept_id from department where dept_name = 'Department of Mathematics and Computer Science'));
insert into course (course_id, course_name, duration, college_id, degree_id, prog_id, dept_id)
values (null, 'Mathematics', '2 Years',
	(select college_id from college where college_name = 'College of Science'),
    (select degree_id from degree where degree_name = 'Master of Science'),
    (select prog_id from programme where prog_name = 'Postgraduate'),
    (select dept_id from department where dept_name = 'Department of Mathematics and Computer Science'));
insert into course (course_id, course_name, duration, college_id, degree_id, prog_id, dept_id)
values (null, 'Mathematics', '5 Years',
	(select college_id from college where college_name = 'College of Science'),
    (select degree_id from degree where degree_name = 'Doctor of Philosophy'),
    (select prog_id from programme where prog_name = 'Postgraduate'),
    (select dept_id from department where dept_name = 'Department of Mathematics and Computer Science'));
insert into course (course_id, course_name, duration, college_id, degree_id, prog_id, dept_id)
values (null, 'Radation Physics', '1 Year',
	(select college_id from college where college_name = 'College of Science'),
    (select degree_id from degree where degree_name = 'Post Graduate Diploma'),
    (select prog_id from programme where prog_name = 'Postgraduate'),
    (select dept_id from department where dept_name = 'Department of Physics'));
insert into course (course_id, course_name, duration, college_id, degree_id, prog_id, dept_id)
values (null, 'Theoretical and Mathematics Physics', '1 Year',
	(select college_id from college where college_name = 'College of Science'),
    (select degree_id from degree where degree_name = 'Post Graduate Diploma'),
    (select prog_id from programme where prog_name = 'Postgraduate'),
    (select dept_id from department where dept_name = 'Department of Physics'));
insert into course (course_id, course_name, duration, college_id, degree_id, prog_id, dept_id)
values (null, 'Physics with Electronics', '1 Year',
	(select college_id from college where college_name = 'College of Science'),
    (select degree_id from degree where degree_name = 'Post Graduate Diploma'),
    (select prog_id from programme where prog_name = 'Postgraduate'),
    (select dept_id from department where dept_name = 'Department of Physics'));
insert into course (course_id, course_name, duration, college_id, degree_id, prog_id, dept_id)
values (null, 'Applied Geophysics', '2 Years',
	(select college_id from college where college_name = 'College of Science'),
    (select degree_id from degree where degree_name = 'Master of Science'),
    (select prog_id from programme where prog_name = 'Postgraduate'),
    (select dept_id from department where dept_name = 'Department of Physics'));
insert into course (course_id, course_name, duration, college_id, degree_id, prog_id, dept_id)
values (null, 'Environmental and Radiation Physics', '2 Years',
	(select college_id from college where college_name = 'College of Science'),
    (select degree_id from degree where degree_name = 'Master of Science'),
    (select prog_id from programme where prog_name = 'Postgraduate'),
    (select dept_id from department where dept_name = 'Department of Physics'));
insert into course (course_id, course_name, duration, college_id, degree_id, prog_id, dept_id)
values (null, 'Theoretical Physics', '2 Years',
	(select college_id from college where college_name = 'College of Science'),
    (select degree_id from degree where degree_name = 'Master of Science'),
    (select prog_id from programme where prog_name = 'Postgraduate'),
    (select dept_id from department where dept_name = 'Department of Physics'));
insert into course (course_id, course_name, duration, college_id, degree_id, prog_id, dept_id)
values (null, 'Physics with Electronics', '2 Years',
	(select college_id from college where college_name = 'College of Science'),
    (select degree_id from degree where degree_name = 'Master of Science'),
    (select prog_id from programme where prog_name = 'Postgraduate'),
    (select dept_id from department where dept_name = 'Department of Physics'));
insert into course (course_id, course_name, duration, college_id, degree_id, prog_id, dept_id)
values (null, 'Environmental and Radiation Physics', '5 Years',
	(select college_id from college where college_name = 'College of Science'),
    (select degree_id from degree where degree_name = 'Doctor of Philosophy'),
    (select prog_id from programme where prog_name = 'Postgraduate'),
    (select dept_id from department where dept_name = 'Department of Physics'));
insert into course (course_id, course_name, duration, college_id, degree_id, prog_id, dept_id)
values (null, 'Theoretical Physics', '5 Years',
	(select college_id from college where college_name = 'College of Science'),
    (select degree_id from degree where degree_name = 'Doctor of Philosophy'),
    (select prog_id from programme where prog_name = 'Postgraduate'),
    (select dept_id from department where dept_name = 'Department of Physics'));
insert into course (course_id, course_name, duration, college_id, degree_id, prog_id, dept_id)
values (null, 'Physics with Electronics', '5 Years',
	(select college_id from college where college_name = 'College of Science'),
    (select degree_id from degree where degree_name = 'Doctor of Philosophy'),
    (select prog_id from programme where prog_name = 'Postgraduate'),
    (select dept_id from department where dept_name = 'Department of Physics'));
insert into course (course_id, course_name, duration, college_id, degree_id, prog_id, dept_id)
values (null, 'Chemical Engineering', '1 Year',
	(select college_id from college where college_name = 'College of Technology'),
    (select degree_id from degree where degree_name = 'Post Graduate Diploma'),
    (select prog_id from programme where prog_name = 'Postgraduate'),
    (select dept_id from department where dept_name = 'Department of Chemical Engineering'));
insert into course (course_id, course_name, duration, college_id, degree_id, prog_id, dept_id)
values (null, 'Chemical Engineering', '2 Years',
	(select college_id from college where college_name = 'College of Technology'),
    (select degree_id from degree where degree_name = 'Master of Engineering'),
    (select prog_id from programme where prog_name = 'Postgraduate'),
    (select dept_id from department where dept_name = 'Department of Chemical Engineering'));
insert into course (course_id, course_name, duration, college_id, degree_id, prog_id, dept_id)
values (null, 'Chemical Engineering', '5 Years',
	(select college_id from college where college_name = 'College of Technology'),
    (select degree_id from degree where degree_name = 'Doctor of Philosophy'),
    (select prog_id from programme where prog_name = 'Postgraduate'),
    (select dept_id from department where dept_name = 'Department of Chemical Engineering'));
insert into course (course_id, course_name, duration, college_id, degree_id, prog_id, dept_id)
values (null, 'Electrical and Electronics Engineering', '1 Year',
	(select college_id from college where college_name = 'College of Technology'),
    (select degree_id from degree where degree_name = 'Post Graduate Diploma'),
    (select prog_id from programme where prog_name = 'Postgraduate'),
    (select dept_id from department where dept_name = 'Department of Electrical and Electronics Engineering'));
insert into course (course_id, course_name, duration, college_id, degree_id, prog_id, dept_id)
values (null, 'Instrumentation and Control', '2 Years',
	(select college_id from college where college_name = 'College of Technology'),
    (select degree_id from degree where degree_name = 'Master of Engineering'),
    (select prog_id from programme where prog_name = 'Postgraduate'),
    (select dept_id from department where dept_name = 'Department of Electrical and Electronics Engineering'));
insert into course (course_id, course_name, duration, college_id, degree_id, prog_id, dept_id)
values (null, 'Electronics and Telecommunications', '2 Years',
	(select college_id from college where college_name = 'College of Technology'),
    (select degree_id from degree where degree_name = 'Master of Engineering'),
    (select prog_id from programme where prog_name = 'Postgraduate'),
    (select dept_id from department where dept_name = 'Department of Electrical and Electronics Engineering'));
insert into course (course_id, course_name, duration, college_id, degree_id, prog_id, dept_id)
values (null, 'Power and Machine', '2 Years',
	(select college_id from college where college_name = 'College of Technology'),
    (select degree_id from degree where degree_name = 'Master of Engineering'),
    (select prog_id from programme where prog_name = 'Postgraduate'),
    (select dept_id from department where dept_name = 'Department of Electrical and Electronics Engineering'));
insert into course (course_id, course_name, duration, college_id, degree_id, prog_id, dept_id)
values (null, 'Instrumentation and Control', '5 Years',
	(select college_id from college where college_name = 'College of Technology'),
    (select degree_id from degree where degree_name = 'Doctor of Philosophy'),
    (select prog_id from programme where prog_name = 'Postgraduate'),
    (select dept_id from department where dept_name = 'Department of Electrical and Electronics Engineering'));
insert into course (course_id, course_name, duration, college_id, degree_id, prog_id, dept_id)
values (null, 'Electronics and Telecommunications', '5 Years',
	(select college_id from college where college_name = 'College of Technology'),
    (select degree_id from degree where degree_name = 'Doctor of Philosophy'),
    (select prog_id from programme where prog_name = 'Postgraduate'),
    (select dept_id from department where dept_name = 'Department of Electrical and Electronics Engineering'));
insert into course (course_id, course_name, duration, college_id, degree_id, prog_id, dept_id)
values (null, 'Power and Machine', '5 Years',
	(select college_id from college where college_name = 'College of Technology'),
    (select degree_id from degree where degree_name = 'Doctor of Philosophy'),
    (select prog_id from programme where prog_name = 'Postgraduate'),
    (select dept_id from department where dept_name = 'Department of Electrical and Electronics Engineering'));
insert into course (course_id, course_name, duration, college_id, degree_id, prog_id, dept_id)
values (null, 'Marine Engineering', '1 Year',
	(select college_id from college where college_name = 'College of Technology'),
    (select degree_id from degree where degree_name = 'Post Graduate Diploma'),
    (select prog_id from programme where prog_name = 'Postgraduate'),
    (select dept_id from department where dept_name = 'Department of Marine Engineering'));
insert into course (course_id, course_name, duration, college_id, degree_id, prog_id, dept_id)
values (null, 'Offshore Engineering', '2 Years',
	(select college_id from college where college_name = 'College of Technology'),
    (select degree_id from degree where degree_name = 'Master of Engineering'),
    (select prog_id from programme where prog_name = 'Postgraduate'),
    (select dept_id from department where dept_name = 'Department of Marine Engineering'));
insert into course (course_id, course_name, duration, college_id, degree_id, prog_id, dept_id)
values (null, 'Ship Power Engineering', '5 Years',
	(select college_id from college where college_name = 'College of Technology'),
    (select degree_id from degree where degree_name = 'Doctor of Philosophy'),
    (select prog_id from programme where prog_name = 'Postgraduate'),
    (select dept_id from department where dept_name = 'Department of Marine Engineering'));
insert into course (course_id, course_name, duration, college_id, degree_id, prog_id, dept_id)
values (null, 'Mechanical Engineering', '1 Year',
	(select college_id from college where college_name = 'College of Technology'),
    (select degree_id from degree where degree_name = 'Post Graduate Diploma'),
    (select prog_id from programme where prog_name = 'Postgraduate'),
    (select dept_id from department where dept_name = 'Department of Mechanical Engineering'));
insert into course (course_id, course_name, duration, college_id, degree_id, prog_id, dept_id)
values (null, 'Thermofluid and Energy', '2 Years',
	(select college_id from college where college_name = 'College of Technology'),
    (select degree_id from degree where degree_name = 'Master of Engineering'),
    (select prog_id from programme where prog_name = 'Postgraduate'),
    (select dept_id from department where dept_name = 'Department of Mechanical Engineering'));
insert into course (course_id, course_name, duration, college_id, degree_id, prog_id, dept_id)
values (null, 'Industrial and Production Engineering', '2 Years',
	(select college_id from college where college_name = 'College of Technology'),
    (select degree_id from degree where degree_name = 'Master of Engineering'),
    (select prog_id from programme where prog_name = 'Postgraduate'),
    (select dept_id from department where dept_name = 'Department of Mechanical Engineering'));
insert into course (course_id, course_name, duration, college_id, degree_id, prog_id, dept_id)
values (null, 'Materials and Metallurgical Engineering', ' 2 Years',
	(select college_id from college where college_name = 'College of Technology'),
    (select degree_id from degree where degree_name = 'Master of Engineering'),
    (select prog_id from programme where prog_name = 'Postgraduate'),
    (select dept_id from department where dept_name = 'Department of Mechanical Engineering'));
insert into course (course_id, course_name, duration, college_id, degree_id, prog_id, dept_id)
values (null, 'Thermofluid and Energy', '5 Years',
	(select college_id from college where college_name = 'College of Technology'),
    (select degree_id from degree where degree_name = 'Doctor of Philosophy'),
    (select prog_id from programme where prog_name = 'Postgraduate'),
    (select dept_id from department where dept_name = 'Department of Mechanical Engineering'));
insert into course (course_id, course_name, duration, college_id, degree_id, prog_id, dept_id)
values (null, 'Industrial and Production Engineering', '5 Years',
	(select college_id from college where college_name = 'College of Technology'),
    (select degree_id from degree where degree_name = 'Doctor of Philosophy'),
    (select prog_id from programme where prog_name = 'Postgraduate'),
    (select dept_id from department where dept_name = 'Department of Mechanical Engineering'));
insert into course (course_id, course_name, duration, college_id, degree_id, prog_id, dept_id)
values (null, 'Materials and Metallurgical Engineering', '2 Years',
	(select college_id from college where college_name = 'College of Technology'),
    (select degree_id from degree where degree_name = 'Doctor of Philosophy'),
    (select prog_id from programme where prog_name = 'Postgraduate'),
    (select dept_id from department where dept_name = 'Department of Mechanical Engineering'));
insert into course (course_id, course_name, duration, college_id, degree_id, prog_id, dept_id)
values (null, 'Petroleum Engineering', '1 Year',
	(select college_id from college where college_name = 'College of Technology'),
    (select degree_id from degree where degree_name = 'Post Graduate Diploma'),
    (select prog_id from programme where prog_name = 'Postgraduate'),
    (select dept_id from department where dept_name = 'Department of Petroleum Engineering'));
insert into course (course_id, course_name, duration, college_id, degree_id, prog_id, dept_id)
values (null, 'Petroleum Engineering (Reservoir Engineering)', '2 Years',
	(select college_id from college where college_name = 'College of Technology'),
    (select degree_id from degree where degree_name = 'Master of Engineering'),
    (select prog_id from programme where prog_name = 'Postgraduate'),
    (select dept_id from department where dept_name = 'Department of Petroleum Engineering'));
insert into course (course_id, course_name, duration, college_id, degree_id, prog_id, dept_id)
values (null, 'Petroleum Engineering (Production Engineering)', '2 Years',
	(select college_id from college where college_name = 'College of Technology'),
    (select degree_id from degree where degree_name = 'Master of Engineering'),
    (select prog_id from programme where prog_name = 'Postgraduate'),
    (select dept_id from department where dept_name = 'Department of Petroleum Engineering'));
insert into course (course_id, course_name, duration, college_id, degree_id, prog_id, dept_id)
values (null, 'Petroleum Engineering (Gas Engineering)', '2 Years',
	(select college_id from college where college_name = 'College of Technology'),
    (select degree_id from degree where degree_name = 'Master of Engineering'),
    (select prog_id from programme where prog_name = 'Postgraduate'),
    (select dept_id from department where dept_name = 'Department of Petroleum Engineering'));
insert into course (course_id, course_name, duration, college_id, degree_id, prog_id, dept_id)
values (null, 'Petroleum Engineering (Drilling Engineering)', '2 Years',
	(select college_id from college where college_name = 'College of Technology'),
    (select degree_id from degree where degree_name = 'Master of Engineering'),
    (select prog_id from programme where prog_name = 'Postgraduate'),
    (select dept_id from department where dept_name = 'Department of Petroleum Engineering'));