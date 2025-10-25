-- Create a view showing all orders along with their total order value
CREATE VIEW orders_with_totals AS
SELECT 
    o.order_id,
    o.customer_id,
    o.order_status,
    o.order_date,
    o.required_date,
    o.shipped_date,
    o.store_id,
    o.staff_id,
    ot.total_order_price
FROM orders o
JOIN (
    SELECT 
        oi.order_id,
        ROUND(SUM(oi.quantity * (oi.list_price * (1 - oi.discount))), 2) AS total_order_price
    FROM order_items oi
    GROUP BY oi.order_id
) ot 
    ON o.order_id = ot.order_id;

-- Retrieve all orders with their total values
SELECT * 
FROM orders_with_totals;
