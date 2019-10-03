select * from student;

select * from course;

-- no middle name
select count(*) from student
	where middleInitial is null; 
select * from student
	where middleInitial is null;
-- number from ohio
select count(*) from student
	where state = "oh";

-- oldest student
select firstName, lastName, birthday
from student
	where birthday in (select min(birthday) from student);
    
-- age of oldest student
select (year(curdate()) - year(birthday)) as age from student
order by age;

select firstname, lastname, (year(curdate()) - year(birthday)) as age
from student
where birthday = (select min(birthday) from student);

-- youngest student
select firstName, lastName, birthday
from student
	where birthday in (select max(birthday) from student);
    
-- how many social studies courses
select count(*) from course
	where subject = 'socialstudies';

-- how many math classes
select count(*) from course
	where subject = 'math';
    
-- list all subjects starting with the letter 'm'
select * from course
	where subject like 'm%';

-- join all 3 tables
select lastName, name, subject, grade
from student s
join enrolled e 
on e.studentID = s.id
join course c 
on e.courseID = c.id
order by lastName;

-- students per state
select count(id), state from student
group by state ;


-- all students plus enrollments
select s.id, firstName, lastname, e.studentId, courseID, grade, c.name
	from student s
	left join enrolled e 
    on e.studentId = s.id
    left join course c
		on e.courseId = c.id;