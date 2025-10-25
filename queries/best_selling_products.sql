-- Create a view for best-selling products with total quantity sold and total sales value
CREATE VIEW best_selling_products AS
SELECT 
    oi.product_id,
    p.product_name,
    p.list_price,
    SUM(oi.quantity) AS total_quantity_sold,
    ROUND(SUM(oi.quantity * (oi.list_price * (1 - oi.discount))), 2) AS total_sales_value
FROM order_items oi
JOIN products p 
    ON oi.product_id = p.product_id
GROUP BY 
    oi.product_id, 
    p.product_name, 
    p.list_price;

-- Retrieve all products from the view, ordered by total quantity sold descending
SELECT * 
FROM best_selling_products
ORDER BY total_quantity_sold DESC;