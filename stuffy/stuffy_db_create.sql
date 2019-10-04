drop database if exists stuffy_db;
create database stuffy_db;
use stuffy_db;

create table stuffy (
	id 				int 			primary key auto_increment,
	type 			varchar(255) 	not null,
	color 			varchar(20) 	not null,
	size 			varchar(2) 		not null,
	limbs		 	int 			not null default 4
	);
    
insert into stuffy (type, color, size, limbs)
values ('Elephant', 'Red', 'L', 5),
		('Rhinoceros', 'Lime Green', 'L', 4),
        ('Centipede', 'Magenta', 'M', 354),
        ('Egg', 'Tie Dye', 'S', 0),
        ('Platapus', 'Mauve', 'M', 4),
        ('Armadillo', 'Puse', 'S', 4),
        ('Unicorn', 'Black', 'M', 4),
        ('Dragon', 'Platnium', 'L', 6),
        ('Rhinovirus', 'Battleship Grey', 'S', 0),
        ('Lobster', 'ChromeFlair', 'M', 10);
        


drop user if exists bmdb_user@localhost;
CREATE USER bmdb_user@localhost IDENTIFIED BY 'sesame';
GRANT SELECT, INSERT, DELETE, UPDATE ON bmdb.* TO bmdb_user@localhost;

