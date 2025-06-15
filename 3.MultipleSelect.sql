
alter procedure getcustomersummary  

@Counrty nvarchar(50) ='United States' -- United States as default parameter
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
customers.country=@Counrty;


select 
avg(price) as avgpriceofproduct,
avg(DATEDIFF(dd,order_date,shipping_date)) as AVgshippingday

FROM [DataWarehouseAnalytics].[gold].[fact_sales]
;
end

exec getcustomersummary  @Counrty='Australia' -- Override default parameter