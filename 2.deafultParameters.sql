
alter procedure getcustomersummary  

@Counrty nvarchar(50) ='United States' -- United States as default parameter
-- @Counrty nvarchar(50) with parameter
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
customers.country=@Counrty
end

exec getcustomersummary  @Counrty='Australia' -- Override default parameter