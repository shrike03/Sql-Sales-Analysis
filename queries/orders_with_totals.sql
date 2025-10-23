-- view orders_with_totals shows all orders along with their total order value

create view orders_with_totals as
select 
o.order_id,
o.customer_id,
o.order_status,
o.order_date,
o.required_date,
o.shipped_date,
o.store_id,
o.staff_id,
ot.total_order_price
from orders o
join (
	   SELECT order_id,
       SUM(quantity * (list_price * (1 - discount))) AS total_order_price
		FROM order_items oi
		GROUP BY order_id) ot 
	on o.order_id = ot.order_id;

select * from orders_with_totals
	