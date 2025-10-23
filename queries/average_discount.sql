-- calculates average_discount based on product discount and selling price in orders

select round((AVG(discount_amount)),2) as average_discount
from(
	select 
		oi.order_id,
		sum((quantity * list_price)  - (quantity * (list_price * (1 - discount)))) as discount_amount
 	from order_items oi
 	group by oi.order_id)
 	as t;
 