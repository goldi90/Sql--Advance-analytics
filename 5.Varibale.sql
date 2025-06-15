
alter procedure getcustomersummary  

@country nvarchar(50) ='United States' --default parramter is United states

as
begin
Declare @AVGSALESAMOUNT int,  @Customercount int
select 
@AVGSALESAMOUNT=AVG(sales_amount),
@Customercount= count(customer_id) 

from 
	DataWarehouseAnalytics.gold.fact_sales as sales

left join
	DataWarehouseAnalytics.gold.dim_customers as customers
on
sales.customer_key=customers.customer_id

where 
customers.country=@country;

print 'Avg sales amount from '+ @country+ ':'+ Cast(@AVGSALESAMOUNT as nvarchar);
print 'total Customer  from '+ @country+ ':' + cast(@Customercount as nvarchar);

select 
avg(price) as avgpriceofproduct,
avg(DATEDIFF(dd,order_date,shipping_date)) as AVgshippingday

FROM [DataWarehouseAnalytics].[gold].[fact_sales];

end

exec getcustomersummary  @country='Australia'
--exec getcustomersummary @country= 'United States'