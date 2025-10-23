-- view top_selling_stores

create view top_sales_staff as
	select
		s.staff_id, 
		s.first_name, 
		s.last_name,
		s.store_id,
		round(sum(owt.total_order_price),2) as total_order_price 
	from staffs s
	join orders_with_totals owt
		on s.staff_id = owt.staff_id
	group by s.staff_id, s.first_name, s.last_name, s.store_id
	order by total_order_price desc;

select * from top_sales_staff




