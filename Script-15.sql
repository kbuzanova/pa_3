create database CBD_Shop
use CBD_Shop


CREATE TABLE Clients (
client_id varchar(255) PRIMARY KEY,
client_name varchar(255),
client_adress varchar(255),
client_email varchar(255),
client_phone varchar(255),
client_birthdate date
)

CREATE TABLE Products (
product_id varchar(255) PRIMARY KEY,
product_name varchar(255),
product_type varchar(255),
product_characteristics varchar(255)
)

CREATE TABLE Managers (
manager_id varchar(255) PRIMARY KEY,
manager_name varchar(255),
manager_email varchar(255),
manager_phone varchar(255),
manager_adress varchar(255),
manager_birthdate date
)

CREATE TABLE Shops (
shop_id varchar(255) PRIMARY KEY,
shop_city varchar(255),
shop_adress varchar(255),
manager_id varchar(255),
FOREIGN KEY (manager_id) REFERENCES Managers(manager_id)
)

CREATE TABLE Workers ( 
worker_id varchar(255) PRIMARY KEY,
worker_name varchar(255),
shop_id  varchar(255),
worker_position varchar(255),
worker_phone varchar(255),
worker_email varchar(255),
worker_address varchar(255),
worker_bankaccount varchar(255),
worker_birthdate date,
FOREIGN KEY (shop_id) REFERENCES Shops(shop_id)
)

CREATE TABLE Suppliers (
supplier_id varchar(255) PRIMARY KEY,
supplier_name varchar(255),
supplier_email varchar(255),
supplier_phone varchar(255),
supplier_address varchar(255)
)

CREATE TABLE Supplies (
supply_id varchar(255) PRIMARY KEY,
supplier_id varchar(255),
shop_id varchar(255),
manager_id varchar(255),
date_of_supply date,
FOREIGN KEY (supplier_id) REFERENCES Suppliers(supplier_id),
FOREIGN KEY (shop_id) REFERENCES Shops(shop_id),
FOREIGN KEY (manager_id) REFERENCES Managers(manager_id)
)



CREATE TABLE Reviews (
review_id varchar(255) PRIMARY KEY,
shop_id varchar(255),
worker_id varchar(255),
client_id varchar(255),
rate int,
comment varchar(255),
date_of_review date,
FOREIGN KEY (worker_id) REFERENCES Workers(worker_id),
FOREIGN KEY (shop_id) REFERENCES Shops(shop_id),
FOREIGN KEY (client_id) REFERENCES Clients(client_id)
)


CREATE TABLE Shifts (
shift_id varchar(255) PRIMARY KEY,
worker_id varchar(255),
shop_id varchar(255),
start_time time,
end_time time,
date_of_shift date,
FOREIGN KEY (worker_id) REFERENCES Workers(worker_id),
FOREIGN KEY (shop_id) REFERENCES Shops(shop_id)

)


CREATE TABLE Orders (
order_id varchar(255) PRIMARY KEY,
client_id varchar(255),
time_of_order datetime,
worker_id varchar(255),
shop_id varchar(255),
order_total decimal(10, 2),
FOREIGN KEY (shop_id) REFERENCES Shops(shop_id),
FOREIGN KEY (worker_id) REFERENCES Workers(worker_id),
FOREIGN KEY (client_id) REFERENCES Clients(client_id)
)

CREATE TABLE Order_items (
order_item_id int PRIMARY KEY AUTO_INCREMENT,
order_id varchar(255),
product_id varchar(255),
quantity decimal(10, 2) NOT NULL,
price DECIMAL(10, 2) NOT NULL,
FOREIGN KEY (order_id) REFERENCES Orders(order_id),
FOREIGN KEY (product_id) REFERENCES Products(product_id)
)



select count(client_id)
from clients

select count(product_id)
from products

select count(manager_id)
from managers

select count(shop_id)
from shops

select count(worker_id)
from workers

select count(supplier_id)
from suppliers
limit 10

select count(supply_id)
from supplies

select count(review_id)
from reviews
limit 200000

select count(shift_id)
from shifts

select count(order_id)
from orders

select count(order_item_id)
from Order_items  
