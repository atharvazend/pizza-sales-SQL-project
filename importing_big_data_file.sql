create database pizaa_sales;
use pizaa_sales ;

create table order_details (
	order_details_id int not null primary key,
    order_id int not null,
    pizaa_id text not null,
    quantity int not null
);

create table orders (
	order_id int not null primary key,
    order_date date not null,
    pizaa_time time not null
);