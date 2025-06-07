select 
	total_sales,
	Order_month,
	sum(total_sales) over (order by order_month) as running_total

from
(

select 
	datetrunc(MONTH,order_date) as Order_month,
	sum(sales_amount) as total_sales
from 
	DataWarehouseAnalytics.gold.fact_sales
where 
	order_date is not null
group by
	 datetrunc(MONTH,order_date)
	 )t