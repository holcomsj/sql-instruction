drop database if exists prs;
create database prs;
use prs;

create table user(
	id			int				primary key auto_increment,
    userName	varchar(20)		not null unique,
    password	varchar(10) 	not null,
    firstName	varchar(20) 	not null,
    lastName	varchar(20)		not null,
    phoneNumber	varchar(12)		not null,
    email		varchar(75)	  	not null,
    isReviewer	tinyint(1)		not null,
    isAdmin		tinyint(1)	 	not null
);

insert into user 
	values
	(1, 'holcomsj', 'password1', 'Sam', 'Holcomb', '937-121-2121', 'samholcomb@email.com', 1, 0),
    (2, 'colvilmm', 'mcdmdnd', 'Matthew', 'Colville', '305-121-2121', 'mattcolville@email.com', 0, 1);


create table vendor(
	id				int				primary key	auto_increment,
    code			varchar(10)		not null unique,
    name			varchar(255)	not null,
    address			varchar(255)	not null,
    city			varchar(255)	not null,
    state 			varchar(2)		not null,
    zip				varchar(5)		not null,
    phoneNumber		varchar(12)		not null,
    email			varchar(100)	not null
    );
    
    insert into vendor 
    values
		(1, 'famfarm000', 'Family Farm', '1575 Wrinkle Rd', 'Springfield', 'MS', '56505', '000-000-0000', 'farmemail@email.com');

create table request (
	id					int				primary key auto_increment,
    userId				int				not null,
    description 		varchar(100)	not null,
    justification		varchar(255)	not null,
    dateNeeded			date			not null,
    deliveryMode		varchar(25)		not null,
    status				varchar(20)		not null,
    total				decimal(10, 2)	not null,
    submittedDate		date			not null,
    reasonForRejection	varchar(100),
    
    FOREIGN KEY (userId) REFERENCES user(id)
);


create table product (
	id			int				primary key auto_increment,
    vendorId	int				not null,
    partNumber	varchar(50)		not null unique,
    name 		varchar(150)	not null,
    price		decimal(10, 2) 	not null,
    unit		varchar(255),
    photoPath	varchar(255),
    
    FOREIGN KEY (vendorId) REFERENCES vendor(id)
);
insert into product (id, vendorId, partNumber, name, price)
	values (1, 1, '123456789', 'Apple Pie', 5.99),
			(2, 1, '234567891', 'Nachos', 3.99); 

create table lineItem (
	id		int			primary key	auto_increment,
    requestId	int		not null unique,
    productId	int		not null unique,
    quantity	int		not null,
    
    FOREIGN KEY (requestId) REFERENCES request(id),
    FOREIGN KEY (productId) REFERENCES product(id)
);






drop user if exists prs_user@localhost;
CREATE USER prs_user@localhost IDENTIFIED BY 'sesame';
GRANT SELECT, INSERT, DELETE, UPDATE ON prs.* TO prs_user@localhost;