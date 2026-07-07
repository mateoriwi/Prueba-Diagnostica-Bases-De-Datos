SELECT 
    eco_id_product AS "Product ID",
    eco_name_product AS "Product Name",
    eco_stock AS "Current Stock"
FROM eco_products
ORDER BY eco_stock DESC;



SELECT 
    c.eco_city AS "City",
    COUNT(o.eco_order_id) AS "Total Orders Placed"
FROM eco_orders o
JOIN eco_customers c ON o.eco_client_id = c.eco_client_id
GROUP BY c.eco_city
ORDER BY "Total Orders Placed" DESC;



SELECT 
    p.eco_category AS "Category",
    SUM(o.eco_quantity * o.eco_unit_price) AS "Total Revenue ($)"
FROM eco_orders o
JOIN eco_products p ON o.eco_product_id = p.eco_id_product
GROUP BY p.eco_category
ORDER BY "Total Revenue ($)" DESC;

SELECT 
    eco_id_product AS "Product ID",
    eco_name_product AS "Product Name",
    eco_stock AS "Current Stock"
FROM eco_products
WHERE eco_stock < 50
ORDER BY eco_stock ASC;

SELECT 
    c.eco_client_id AS "Client ID",
    c.eco_client_name AS "Client Name",
    COUNT(o.eco_order_id) AS "Total Orders"
FROM eco_orders o
JOIN eco_customers c ON o.eco_client_id = c.eco_client_id
GROUP BY c.eco_client_id, c.eco_client_name
ORDER BY "Total Orders" DESC
LIMIT 5;



SELECT 
    dc.eco_center_name AS "Distribution Center",
    SUM(o.eco_quantity * o.eco_unit_price) AS "Inventory Value Distributed ($)"
FROM eco_orders o
JOIN eco_distribution_centers dc ON o.eco_center_id = dc.eco_center_id
GROUP BY dc.eco_center_name
ORDER BY "Inventory Value Distributed ($)" DESC;
