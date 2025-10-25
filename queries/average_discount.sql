-- Calculate average discount per order based on product discount and selling price
SELECT 
    ROUND(AVG(discount_amount), 2) AS average_discount
FROM (
    SELECT 
        oi.order_id,
        SUM(
            (oi.quantity * oi.list_price) - (oi.quantity * (oi.list_price * (1 - oi.discount)))
        ) AS discount_amount
    FROM order_items oi
    GROUP BY oi.order_id
) AS t;
 