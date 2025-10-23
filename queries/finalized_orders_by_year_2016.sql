-- counting finalized orders for the year 2016

SELECT COUNT(*) AS total_orders_2016
FROM orders_with_totals
WHERE LEFT(required_date, 4) = '2016';