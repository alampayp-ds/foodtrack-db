CREATE DATABASE foodtruck;


USE foodtruck;


CREATE SCHEMA foodtruck;

CREATE SCHEMA products;

CREATE SCHEMA orders;

CREATE SCHEMA locations;


CREATE TABLE foodtruck.foodtruck (
    foodtruck_id INT IDENTITY (1,1) PRIMARY KEY,
    name NVARCHAR(100) NOT NULL,
    cuisine_type NVARCHAR(100) NOT NULL,
    city NVARCHAR(100) NOT NULL
);


CREATE TABLE products.products (
    product_id INT IDENTITY (101,1) PRIMARY KEY,
    foodtruck_id INT NOT NULL,
    name NVARCHAR(100) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    stock INT NOT NULL,

        CONSTRAINT FK_products_foodtruck
            FOREIGN KEY (foodtruck_id)
            REFERENCES foodtruck.foodtruck(foodtruck_id)

);


CREATE TABLE orders.orders (
    order_id INT IDENTITY (1001, 1) PRIMARY KEY,
    foodtruck_id INT NOT NULL,
    order_date DATE NOT NULL,
    status NVARCHAR(100) NOT NULL,
    total DECIMAL(10,2) NOT NULL,

        CONSTRAINT FK_orders_foodtruck
            FOREIGN KEY (foodtruck_id)
            REFERENCES foodtruck.foodtruck(foodtruck_id)
);


CREATE TABLE orders.items (
    item_id INT IDENTITY (1,1) PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,

        CONSTRAINT FK_items_orders
            FOREIGN KEY (order_id)
            REFERENCES orders.orders(order_id),

        CONSTRAINT FK_items_products
            FOREIGN KEY (product_id)
            REFERENCES products.products(product_id)
);


CREATE TABLE locations.locations (
    location_id INT IDENTITY (1,1) PRIMARY KEY,
    foodtruck_id INT NOT NULL,
    location_date DATE NOT NULL,
    zone NVARCHAR(100),

        CONSTRAINT FK_locations_foodtruck
            FOREIGN KEY (foodtruck_id)
            REFERENCES foodtruck.foodtruck(foodtruck_id)
);