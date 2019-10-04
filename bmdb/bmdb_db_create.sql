drop database if exists bmdb;
create database bmdb;
use bmdb;

create table movie (
	id 				int 			primary key auto_increment,
	title 			varchar(100) 	not null,
	rating 			varchar(5) 		not null,
	year 			int 			not null,
	director   		varchar(50)		not null
);

Insert into movie 
values  (1, 'Spider-Man Into the Spider-Verse', 'PG', 2018, 'Bob Persichetti'),
		(2, 'Big Hero 6', 'PG', 2014, 'Don Hall'),
		(3, 'UHF', 'PG-13', 1989, 'Jay Levey'),
		(4, 'The Incredibles', 'PG', 2004, 'Brad Bird'),
		(5, 'Dr. Strange', 'PG-13', 2016, 'Scot Derrickson'),
		(6, 'Fantastic Beasts and Where to Find Them', 'PG-13', 2016, 'David Yates'),
		(7, 'The Evil Dead', 'NC-13', 1981, 'Sam Raimi'),
		(8, 'Thor: Ragnarok', 'PG-13', 2017, 'Taika Waititi'),
		(9, 'Solo', 'PG-13', 2018, 'Ron Howard'),
		(10, 'The Road to El Dorado', 'PG', 2000, 'Bibo Bergeron');

create table actor (
	id 				int 			not null primary key auto_increment,
	firstName 		varchar(25) 	not null,
	lastName		varchar(25) 	not null,
	gender 			varchar(6) 	not null,
    birthdate		date			not null
   -- constraint unq_actor unique (firstName, lastName, birthdate)
);



Insert into actor 
values (1,'Shameik', 'Moore', 'male', '1995-05-04'),
		(2, 'Jake', 'Johnson', 'male', '1987-05-28'),
        (3, 'Hailee', 'Steinfield', 'female', '1996-12-11'),
        (4, 'Kevin', 'McCarthy', 'male', '1914-02-15'),
        (5, "'Weird Al'", 'Yankovic', 'male', '1959-10-23'),
        (6, 'Victoria', 'Jackson', 'female', '1959-08-02'),
        (7, 'Jamie', 'Chung', 'female', '1983-04-10'),
        (8, 'Scott', 'Adsit', 'male', '1965-11-12'),
        (9, 'Ryan', 'Potter', 'male', '1995-09-12'),
        (10, 'Craig', 'Nelson', 'male', '1944-04-04'),
        (11, 'Holly', 'Hunter', 'female', '1958-03-20'),
        (12, 'Benedict', 'Cumberbatch', 'male', '1976-06-19'),
        (13, 'Chiwetel', 'Ejiofor', 'male', '1977-06-10'),
        (14, 'Eddie', 'Redmayne', 'male', '1982-01-06'),
        (15, 'Colin', 'Farrell', 'male', '1976-05-31'),
        (16, 'Bruce', 'Campbell', 'male', '1958-07-22'),
        (17, 'Ellen', 'Sandweiss', 'female', '1958-12-30'),
        (18, 'Chris', 'Hemsworth', 'male', '1983-08-11'),
        (19, 'Tom', 'Hiddleston', 'male', '1981-02-09'),
        (20, 'Kevin', 'Kline', 'male', '1947-10-24'),
        (21, 'Kenneth', 'Branagh', 'male', '1960-12-10'),
        (22, 'Alden', 'Ehrenreich', 'male', '1989-11-22'),
        (23, 'Joonas', 'Suotamo', 'male', '1986-10-3')
        ;
        
create table credit (
	id			int				not null primary key auto_increment,
    actorId		int				not null,
    movieId 	int				not null,
    role		varchar(30)		not null,
    constraint act_mov unique (actorId, movieId)
);

ALTER TABLE credit
ADD FOREIGN KEY (actorId) REFERENCES actor(id);
alter table credit
add foreign key (movieId) references movie(id);

insert into credit (actorId, movieId, role)
values (1, 1, "Miles Morales/Spider-Man"),
		(2, 1, "Peter B. Parker/Spider-Man"),
        (3, 1, "Gwen Stacy/Spider-Gwen"),
        (4, 3, "R.J. Fletcher"),
        (5, 3, "George Newman"),
        (6, 3, "Teri Campbell"),
        (7, 2, "Go Go"),
        (8, 2, "Baymax"),
        (9, 2, "Hiro"),
        (10, 4, "Bob Parr"),
        (11, 4, "Helen Parr"),
        (12, 5, "Doctor Stephen Strange"),
        (13, 5, "Baymax"),
        (14, 6, "Newt"),
        (15, 6, "Graves"),
        (16, 7, "Ash Williams"),
        (17, 7, "Cheryl"),
        (18, 8, "Thor"),
        (19, 8, "Loki"),
        (20, 10, "Tulio"),
        (21, 10, "Miguel"),
        (22, 9, "Han Solo"),
        (23, 9, "Chewbacca");
        
-- create a user and grant privileges to that user
drop user if exists bmdb_user@localhost;
CREATE USER bmdb_user@localhost IDENTIFIED BY 'sesame';
GRANT SELECT, INSERT, DELETE, UPDATE ON bmdb.* TO bmdb_user@localhost;


