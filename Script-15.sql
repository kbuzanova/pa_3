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



ALTER TABLE Clients
COMMENT = 'Table to store information about clients';

ALTER TABLE Clients
MODIFY COLUMN client_id VARCHAR(255) COMMENT 'Unique identifier for each client',
MODIFY COLUMN client_name VARCHAR(255) COMMENT 'Name of the client',
MODIFY COLUMN client_adress VARCHAR(255) COMMENT 'Address of the client',
MODIFY COLUMN client_email VARCHAR(255) COMMENT 'Email of the client',
MODIFY COLUMN client_phone VARCHAR(255) COMMENT 'Phone number of the client',
MODIFY COLUMN client_birthdate DATE COMMENT 'Birthdate of the client';


ALTER TABLE Products
COMMENT = 'Table to store product details';

ALTER TABLE Products
MODIFY COLUMN product_id VARCHAR(255) COMMENT 'Unique identifier for each product',
MODIFY COLUMN product_name VARCHAR(255) COMMENT 'Name of the product',
MODIFY COLUMN product_type VARCHAR(255) COMMENT 'Type/category of the product',
MODIFY COLUMN product_characteristics VARCHAR(255) COMMENT 'Key characteristics of the product';


ALTER TABLE Managers
COMMENT = 'Table to store manager information';

ALTER TABLE Managers
MODIFY COLUMN manager_id VARCHAR(255) COMMENT 'Unique identifier for each manager',
MODIFY COLUMN manager_name VARCHAR(255) COMMENT 'Name of the manager',
MODIFY COLUMN manager_email VARCHAR(255) COMMENT 'Email of the manager',
MODIFY COLUMN manager_phone VARCHAR(255) COMMENT 'Phone number of the manager',
MODIFY COLUMN manager_adress VARCHAR(255) COMMENT 'Address of the manager',
MODIFY COLUMN manager_birthdate DATE COMMENT 'Birthdate of the manager';


ALTER TABLE Shops
COMMENT = 'Table to store shop details and assign managers';

ALTER TABLE Shops
MODIFY COLUMN shop_id VARCHAR(255) COMMENT 'Unique identifier for each shop',
MODIFY COLUMN shop_city VARCHAR(255) COMMENT 'City where the shop is located',
MODIFY COLUMN shop_adress VARCHAR(255) COMMENT 'Address of the shop',
MODIFY COLUMN manager_id VARCHAR(255) COMMENT 'Manager assigned to the shop';


ALTER TABLE Workers
COMMENT = 'Table to store information about workers';

ALTER TABLE Workers
MODIFY COLUMN worker_id VARCHAR(255) COMMENT 'Unique identifier for each worker',
MODIFY COLUMN worker_name VARCHAR(255) COMMENT 'Name of the worker',
MODIFY COLUMN shop_id VARCHAR(255) COMMENT 'Shop where the worker is assigned',
MODIFY COLUMN worker_position VARCHAR(255) COMMENT 'Position of the worker',
MODIFY COLUMN worker_phone VARCHAR(255) COMMENT 'Phone number of the worker',
MODIFY COLUMN worker_email VARCHAR(255) COMMENT 'Email of the worker',
MODIFY COLUMN worker_address VARCHAR(255) COMMENT 'Address of the worker',
MODIFY COLUMN worker_bankaccount VARCHAR(255) COMMENT 'Bank account of the worker',
MODIFY COLUMN worker_birthdate DATE COMMENT 'Birthdate of the worker';


ALTER TABLE Suppliers
COMMENT = 'Table to store supplier information';

ALTER TABLE Suppliers
MODIFY COLUMN supplier_id VARCHAR(255) COMMENT 'Unique identifier for each supplier',
MODIFY COLUMN supplier_name VARCHAR(255) COMMENT 'Name of the supplier',
MODIFY COLUMN supplier_email VARCHAR(255) COMMENT 'Email of the supplier',
MODIFY COLUMN supplier_phone VARCHAR(255) COMMENT 'Phone number of the supplier',
MODIFY COLUMN supplier_address VARCHAR(255) COMMENT 'Address of the supplier';


ALTER TABLE Supplies
COMMENT = 'Table to store information about supplies';

ALTER TABLE Supplies
MODIFY COLUMN supply_id VARCHAR(255) COMMENT 'Unique identifier for each supply event',
MODIFY COLUMN supplier_id VARCHAR(255) COMMENT 'ID of the supplier',
MODIFY COLUMN shop_id VARCHAR(255) COMMENT 'ID of the shop receiving the supply',
MODIFY COLUMN manager_id VARCHAR(255) COMMENT 'Manager overseeing the supply',
MODIFY COLUMN date_of_supply DATE COMMENT 'Date when the supply was received';

ALTER TABLE Reviews
COMMENT = 'Table to store reviews and ratings from clients';

ALTER TABLE Reviews
MODIFY COLUMN review_id VARCHAR(255) COMMENT 'Unique identifier for each review',
MODIFY COLUMN shop_id VARCHAR(255) COMMENT 'ID of the shop being reviewed',
MODIFY COLUMN worker_id VARCHAR(255) COMMENT 'ID of the worker receiving the review',
MODIFY COLUMN client_id VARCHAR(255) COMMENT 'ID of the client writing the review',
MODIFY COLUMN rate INT COMMENT 'Rating given by the client (1-5)',
MODIFY COLUMN comment VARCHAR(255) COMMENT 'Client feedback or review comment',
MODIFY COLUMN date_of_review DATE COMMENT 'Date when the review was submitted';


ALTER TABLE Shifts
COMMENT = 'Table to store shift schedules for workers';

ALTER TABLE Shifts
MODIFY COLUMN shift_id VARCHAR(255) COMMENT 'Unique identifier for each shift',
MODIFY COLUMN worker_id VARCHAR(255) COMMENT 'ID of the worker assigned to the shift',
MODIFY COLUMN shop_id VARCHAR(255) COMMENT 'ID of the shop where the shift takes place',
MODIFY COLUMN start_time TIME COMMENT 'Start time of the shift',
MODIFY COLUMN end_time TIME COMMENT 'End time of the shift',
MODIFY COLUMN date_of_shift DATE COMMENT 'Date when the shift occurs';


ALTER TABLE Orders
COMMENT = 'Table to store information about client orders';

ALTER TABLE Orders
MODIFY COLUMN order_id VARCHAR(255) COMMENT 'Unique identifier for each order',
MODIFY COLUMN client_id VARCHAR(255) COMMENT 'ID of the client making the order',
MODIFY COLUMN time_of_order DATETIME COMMENT 'Timestamp when the order was placed',
MODIFY COLUMN worker_id VARCHAR(255) COMMENT 'ID of the worker processing the order',
MODIFY COLUMN shop_id VARCHAR(255) COMMENT 'ID of the shop where the order was placed',
MODIFY COLUMN order_total DECIMAL(10, 2) COMMENT 'Total amount of the order';


ALTER TABLE Order_items
COMMENT = 'Table to store individual items within each order';

ALTER TABLE Order_items
MODIFY COLUMN order_item_id INT AUTO_INCREMENT COMMENT 'Unique identifier for each order item',
MODIFY COLUMN order_id VARCHAR(255) COMMENT 'ID of the order to which the item belongs',
MODIFY COLUMN product_id VARCHAR(255) COMMENT 'ID of the product being ordered',
MODIFY COLUMN quantity DECIMAL(10, 2) NOT NULL COMMENT 'Quantity of the product ordered',
MODIFY COLUMN price DECIMAL(10, 2) NOT NULL COMMENT 'Price of the product at the time of order';


CREATE USER 'supplier_baryga_petya'@'localhost' IDENTIFIED BY 'duzhenadiyniyparol';
GRANT SELECT ON supplies TO 'supplier_baryga_petya'@'localhost';
SHOW GRANTS FOR 'supplier_baryga_petya'@'localhost';


CREATE USER 'ceo'@'localhost' IDENTIFIED BY 'SuperStrongPassword123!';
GRANT ALL PRIVILEGES ON cbd_shop.* TO 'ceo'@'localhost';
SHOW GRANTS FOR 'ceo'@'localhost';


CREATE USER 'data_analytic'@'%' IDENTIFIED BY 'superjun';
GRANT SELECT, CREATE TEMPORARY TABLES, EXECUTE ON cbd_shop.* TO 'data_analytic'@'%';
SHOW GRANTS FOR 'data_analytic'@'%';

CREATE TABLE order_count (
    quantity int
);

INSERT INTO order_count (quantity) VALUES (0);

CREATE TRIGGER increment_order_count after insert on Orders
for each row 
update order_count 
set quantity = quantity + 1

create index idx_orders_time_of_order on orders(time_of_order);
create index idx_clients_name on clients(client_name);
create index idx_workers_name on workers(worker_name);
create index idx_products_name on products(product_name);


create view ordersdetails as
select 
    o.order_id, 
    o.time_of_order, 
    o.order_total,
    c.client_name, 
    c.client_email, 
    w.worker_name, 
    s.shop_city, 
    s.shop_adress,
    p.product_name, 
    p.product_type, 
    oi.quantity, 
    oi.price
from orders o
join clients c on o.client_id = c.client_id
join workers w on o.worker_id = w.worker_id
join shops s on o.shop_id = s.shop_id
join order_items oi on o.order_id = oi.order_id
join products p on oi.product_id = p.product_id
where o.time_of_order > '2023-01-01'
order by o.time_of_order desc;


explain analyze
select *
from OrdersDetails


create procedure add_new_client(
    in clientid varchar(255),
    in clientname varchar(255),
    in clientadress varchar(255),
    in clientemail varchar(255),
    in clientphone varchar(255),
    in clientbirthdate date
)
begin
    insert into clients (client_id, client_name, client_adress, client_email, client_phone, client_birthdate)
    values (clientid, clientname, clientadress, clientemail, clientphone, clientbirthdate);
end;

call add_new_client('client1', 'John Doe', '123 Main St', 'john@example.com', '123-456-7890', '1990-01-01');



-- select count(client_id)
-- from clients

-- select count(product_id)
-- from products
-- 
-- select count(manager_id)
-- from managers
-- 
-- select count(shop_id)
-- from shops
-- 
-- select count(worker_id)
-- from workers
-- 
-- select count(supplier_id)
-- from suppliers
-- limit 10
-- 
-- select count(supply_id)
-- from supplies
-- 
-- select count(review_id)
-- from reviews
-- 
-- select count(shift_id)
-- from shifts
-- 
-- select count(order_id)
-- from orders
-- 
-- select count(order_item_id)
-- from Order_items  
