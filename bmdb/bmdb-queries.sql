select * from movie;
select * from actor;
select * from credit;

select firstName , lastName from actor
	where birthdate > '1994-10-16';
select firstName , lastName from actor
	where birthdate < '1994-10-16';
    
select title as "Title", firstName as "First Name", lastName as "Last Name", role as "Role"
	from movie m
    join credit c
    on m.id = movieId
    join actor a 
    on a.id = actorId;
    
select Title, concat(firstName, " ", lastName) as "Name", Role
	from movie m
    join credit c
    on m.id = movieId
    join actor a 
    on a.id = actorId;