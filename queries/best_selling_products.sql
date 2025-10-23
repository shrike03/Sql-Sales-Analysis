-- best sellings products with total quantity sold and total sales value

create view best_selling_products as
select 
oi.product_id,
p.product_name,
p.list_price,
sum(oi.quantity) as total_quantity_sold,
round(sum(oi.quantity*(oi.list_price*(1-oi.discount))), 2) as total_price
from order_items oi
join
products p on oi.product_id = p.product_id
group by oi.product_id, p.product_name, p.list_price;  

select * from best_selling_products
ORDER BY total_quantity_sold DESC;
