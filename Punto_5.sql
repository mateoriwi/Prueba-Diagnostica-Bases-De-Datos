    INSERT INTO eco_customers (eco_client_id, eco_client_name, eco_city)
    VALUES ('CLI-011', 'BioMarket', 'Cali');


    INSERT INTO eco_orders (eco_order_id, eco_order_date, eco_client_id, eco_product_id, eco_quantity, eco_unit_price, eco_center_id)
    VALUES ('O1021', '2026-05-20', 'CLI-011', 'PRO-001', 15, 2.50, 'CEN-001');


    UPDATE eco_distribution_centers
    SET eco_center_name = 'North Logistics Hub'
    WHERE eco_center_id = 'CEN-001';


    INSERT INTO eco_products (eco_id_product, eco_name_product, eco_category, eco_unit_price, eco_stock)
    VALUES ('PRO-999', 'Test Product Organic', 'Vegetables', 5.50, 10);


    DELETE FROM eco_products
    WHERE eco_id_product = 'PRO-999';

