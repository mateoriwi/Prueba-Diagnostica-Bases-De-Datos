CREATE DATABASE IF NOT EXISTS bd_mateo_hernandez_puerta_de_oro;
USE bd_mateo_hernandez_puerta_de_oro;

CREATE TABLE IF NOT EXISTS eco_customers (
    eco_client_id VARCHAR(50) NOT NULL,
    eco_client_name VARCHAR(100) NOT NULL,
    eco_city VARCHAR(100) NOT NULL,
    PRIMARY KEY (eco_client_id)
);

CREATE TABLE IF NOT EXISTS eco_products (
    eco_id_product VARCHAR(50) NOT NULL,
    eco_name_product VARCHAR(100) NOT NULL,
    eco_category VARCHAR(100) NOT NULL,
    eco_unit_price DECIMAL(10, 2) NOT NULL,
    eco_stock INT NOT NULL,
    PRIMARY KEY (eco_id_product),
    UNIQUE (eco_name_product)
);

CREATE TABLE IF NOT EXISTS eco_distribution_centers (
    eco_center_id VARCHAR(50) NOT NULL,
    eco_center_name VARCHAR(100) NOT NULL,
    PRIMARY KEY (eco_center_id),
    UNIQUE (eco_center_name)
);

CREATE TABLE IF NOT EXISTS eco_orders (
    eco_order_id VARCHAR(50) NOT NULL,
    eco_order_date DATE NOT NULL,
    eco_client_id VARCHAR(50) NOT NULL,
    eco_product_id VARCHAR(50) NOT NULL,
    eco_quantity INT NOT NULL,
    eco_unit_price DECIMAL(10, 2) NOT NULL,
    eco_center_id VARCHAR(50) NOT NULL,
    PRIMARY KEY (eco_order_id),
    FOREIGN KEY (eco_client_id) REFERENCES eco_customers (eco_client_id),
    FOREIGN KEY (eco_product_id) REFERENCES eco_products (eco_id_product),
    FOREIGN KEY (eco_center_id) REFERENCES eco_distribution_centers (eco_center_id)
);
