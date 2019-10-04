select * from stuffy;
-- insert a 'dummy' stuffy
insert into stuffy
	(type, color, size, limbs)
    values
		("Dummy", "A dumb one", "D", 42);


-- Update that new record
update stuffy
	set size = "T" 
    where id = 11;

-- delete that record
delete
from stuffy
where id = 11;