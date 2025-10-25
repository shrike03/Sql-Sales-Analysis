-- Create a view showing total sales per store
CREATE VIEW top_selling_stores AS
SELECT
    s.store_id,
    s.store_name,
    ROUND(SUM(owt.total_order_price), 2) AS total_order_price
FROM stores s
JOIN orders_with_totals owt
    ON s.store_id = owt.store_id
GROUP BY 
    s.store_id, 
    s.store_name
ORDER BY total_order_price DESC;

-- Retrieve all stores with their total sales
SELECT * 
FROM top_selling_stores;
