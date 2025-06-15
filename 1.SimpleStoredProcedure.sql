
create procedure getcustomersummary  
as
begin
select 
AVG(sales_amount) as AVGSALESAMOUNT,
count(customer_id)  as Customercount

from 
	DataWarehouseAnalytics.gold.fact_sales as sales

left join
	DataWarehouseAnalytics.gold.dim_customers as customers
on
sales.customer_key=customers.customer_id

where 
customers.country='Australia'
end

exec getcustomersummary  