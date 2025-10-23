-- view top_selling_stores

create view top_selling_stores as
	select
		s.store_id,
		s.store_name,
		round(sum(owt.total_order_price),2) as total_order_price 
	from stores s
	join orders_with_totals owt
		on s.store_id = owt.store_id
	group by s.store_id, s.store_name
	order by total_order_price desc;

select * from top_selling_stores

