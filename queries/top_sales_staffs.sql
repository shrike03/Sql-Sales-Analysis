-- Create a view showing total sales per staff member
CREATE VIEW top_sales_staff AS
SELECT
    s.staff_id, 
    s.first_name, 
    s.last_name,
    s.store_id,
    ROUND(SUM(owt.total_order_price), 2) AS total_order_price
FROM staffs s
JOIN orders_with_totals owt
    ON s.staff_id = owt.staff_id
GROUP BY 
    s.staff_id, 
    s.first_name, 
    s.last_name, 
    s.store_id
ORDER BY total_order_price DESC;

-- Retrieve all staff with their total sales
SELECT * 
FROM top_sales_staff;



