drop database if exists school_library;

create database school_library;

use school_library;

-- create tables

-- roles
	create table roles(
		id int primary key auto_increment,
		position varchar(50) not null);

	-- employees
	create table employees(
		id int primary key auto_increment,
		name varchar(50) not null,
		email varchar(50) unique,
		phone_no varchar (20),
		role_id int,
		foreign key (role_id) references roles (id));

-- states()
create table states(
	id int primary key auto_increment,
	name varchar(50) not null
);

-- townships()
create table townships(
	id int primary key auto_increment,
	name varchar(50) not null,
	state_id int,
	foreign key (state_id) references states (id)
);

-- addresses()
create table addresses(
	id int primary key auto_increment,
	name varchar(255) not null,
	township_id int,
	foreign key (township_id) references townships (id)
);

-- members()
create table members(
	id int primary key auto_increment,
	name varchar(50) not null,
	email varchar(50) not null unique,
	phone_number varchar(20),
	address_id int,
	created_date date,
	updated_date date,
	status enum('active','inactive') default('active'),
	foreign key (address_id) references addresses (id)
);

-- genres
create table genres(
id int primary key auto_increment,
name varchar(60) not null
);

-- authors
create table authors(
id int primary key auto_increment,
name varchar(50) not null,
phone_no varchar(20),
email varchar(20) unique
);

-- publishers
create table publishers(
id int primary key auto_increment,
name varchar(30) not null
);

-- books
create table books(
id int primary key auto_increment,
name varchar(60) not null,
author_id int,
edition varchar(50),
description varchar(255),
publisher_id int,
genre_id int,
added_by int not null,
created_date date,
foreign key(author_id) references authors(id),
foreign key(added_by) references employees(id),
foreign key(genre_id) references genres(id),
foreign key(publisher_id) references publishers(id)
);

-- book_details
create table book_details(
book_id int primary key,
total_books int,
foreign key(book_id) references books(id)
);

-- borrow_details
create table borrow_details (
	id int primary key auto_increment,
	member_id int not null,
	book_id int not null,
	employee_id int not null,
	borrow_date date,
	return_date date,
	foreign key (member_id) references members (id),
	foreign key (book_id) references books (id),
	foreign key (employee_id) references employees (id)
);