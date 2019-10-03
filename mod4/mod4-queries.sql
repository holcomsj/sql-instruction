-- select all customers
select * from customer where state = 'OH' order by name;


-- select name and credit limt column, all rows
select c.name 'Name', c.creditLimit as 'Credit Limit' from customer c;

-- join view - all columns
select * from customer
join orders
on customer.id = orders.customerID;

-- join view - report format w/ customer name, date, total
select c.name 'Customer Name', 
	date_format(o.date, '%M %e %Y') as 'Date', 
	concat('$',o.total) as 'Order Total' 
from customer c
join orders o
on c.id = customerID;

-- join view report format subselect
select c.name 'Customer Name', 
	date_format(o.date, '%M %e %Y') as 'Date', 
	concat('$',o.total) as 'Order Total' 
from customer c
join orders o
on c.id = customerID
	where o.total > (
		select avg(total) from orders);
        
-- get sum of all orders
select sum(total)
 from orders;
 
-- get the sum of all orders by customers
select customerId, sum(total)
 from orders
 group by customerId;
 
-- joining and summing totals
select c.name "Customer Name",
	concat("$", sum(total)) as "Order Total"
    from customer c
    join orders o
    on c.id = customerId
    group by customerID;
    
-- count function
select count(*)
	from orders;
    
-- min, max
select min(total) from orders;

-- select a row by id
select * from customer where id = 5;

-- insert a new customer
Insert into customer (name, city, state, isCorpAcct, creditLimit)
values ('dummy', 'dummy', 'dy', 0, 69);

insert into customer
values (10, 'dummy2', 'dummy', 'dy', 0, 100, 1);

insert into customer (name, city, state, isCorpAcct, creditLimit)
values
	('dummy3', 'dummy', 'dy', 0, 5555.55),
    ('dummy4', 'dummy', 'dy', 0, 5555.55),
    ('dummy5', 'dummy', 'dy', 0, 5555.55);
    
-- update
update customer
	set name = 'Dummy1'
    where id = 8;
    
delete from customer
	where id > 7;

-- delete
delete from customer
where id in (11, 12, 13);

select * from customer;

-- get the sum of all orders by customers with the HAVING keyword
select customerId, sum(total)
 from sqlbootcamp_mod4.orders
 group by customerId
 having sum(total) > 1000;