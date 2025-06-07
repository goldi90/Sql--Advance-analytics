select 
	order_date,
	sum(sales_amount) as total_sales

from 
	DataWarehouseAnalytics.gold.fact_sales
where 
	order_date is not null
group by
order_date
order by  order_date 

---  bellow is down is sales amount by year with another measures

select 
	year(order_date),
	sum(sales_amount) as total_sales,
	count(distinct customer_key) as total_customer,
	sum(quantity) as sales_quantity

from 
	DataWarehouseAnalytics.gold.fact_sales
where 
	order_date is not null
group by
year(order_date)
order by  year(order_date) 

--- month and year with 

select 
	year(order_date) order_year,
	month(order_date) as ordermonth,
	sum(sales_amount) as total_sales,
	count(distinct customer_key) as total_customer,
	sum(quantity) as sales_quantity

from 
	DataWarehouseAnalytics.gold.fact_sales
where 
	order_date is not null
group by
	year(order_date),
	month(order_date)
order by 
	year(order_date),
	month(order_date) 

-- DATETRUNC funtion

/* DATE_TRUNC function SQL mein kisi date value ko ek specific interval tak chota karne ke liye use hota hai,
jaise ki mahine ki shuruaat ya saal ki shuruaat Yeh date ke un parts ko default value par set kar deta hai jo specified interval se chote hain. 
For example, agar aap DATE_TRUNC('month', order_date) use karte hain, 
toh yeh ek mahine ke andar sabhi dates ko us mahine ki pehli tarikh par set kar dega. same saal ke liye bhi*/
select 
	DATETRUNC(month,order_date) as  orderdate,
	sum(sales_amount) as total_sales,
	count(distinct customer_key) as total_customer,
	sum(quantity) as sales_quantity
/*  DATE_TRUNC("year", order_date) year ka first day deta hai, aur YEAR(order_date) year value nikalta hai.*/
from 
	DataWarehouseAnalytics.gold.fact_sales
where 
	order_date is not null
group by
	DATETRUNC(month,order_date)
order by 
	DATETRUNC(month,order_date)

--DATE_TRUNC('year', use karne se woh saal ki pehli tarikh par set kar dega jaise ki January 1st us specific year ka

select 
	DATETRUNC(year,order_date) as  orderdate,
	sum(sales_amount) as total_sales,
	count(distinct customer_key) as total_customer,
	sum(quantity) as sales_quantity

from 
	DataWarehouseAnalytics.gold.fact_sales
where 
	order_date is not null
group by
	DATETRUNC(year,order_date)
order by 
	DATETRUNC(year,order_date)


	-- FORMAT()
SELECT
    FORMAT(order_date, 'yyyy-MMM') AS order_date,
    SUM(sales_amount) AS total_sales,
    COUNT(DISTINCT customer_key) AS total_customers,
    SUM(quantity) AS total_quantity
FROM gold.fact_sales
WHERE order_date IS NOT NULL
GROUP BY FORMAT(order_date, 'yyyy-MMM')
ORDER BY FORMAT(order_date, 'yyyy-MMM');