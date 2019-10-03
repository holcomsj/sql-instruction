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
		(3, 'UHF', 'PG-13', 1989, 'Jay Levey');


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
        (9, 'Ryan', 'Potter', 'male', '1995-09-12');
        
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
        (9, 2, "Hiro");
        
-- create a user and grant privileges to that user
CREATE USER bmdb_user@localhost IDENTIFIED BY 'sesame';
GRANT SELECT, INSERT, DELETE, UPDATE ON bmdb.* TO bmdb_user@localhost;


