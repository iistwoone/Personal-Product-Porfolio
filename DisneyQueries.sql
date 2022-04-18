/*Total by Category X Quarter*/
SELECT category, order_quarter, sum(total) AS TOTAL
FROM sales_processed
GROUP BY category, order_quarter
ORDER BY 2, 3 DESC;

/*Average by Category X Quarter*/
SELECT category, order_quarter, avg(total) AS AVERAGE
FROM sales_processed
GROUP BY category, order_quarter
ORDER BY 2, 3 DESC;

/*Total by Category X Month*/
SELECT category, order_month, sum(total) AS TOTAL
FROM sales_processed
GROUP BY category, order_month
ORDER BY 2, 3 DESC;

/*Average by Category X Month*/
SELECT category, order_month, avg(total) AS AVERAGE
FROM sales_processed
GROUP BY category, order_month
ORDER BY 2, 3 DESC;

/*Total by Region X Quarter*/
SELECT region, order_quarter, sum(total) AS TOTAL
FROM sales_processed
GROUP BY region, order_quarter
ORDER BY 2, 3 DESC;

/*Total by Region X Month*/
SELECT region, order_month, sum(total) AS TOTAL
FROM sales_processed
GROUP BY region, order_month
ORDER BY 2, 3 DESC;

/*Total Products in Year 2019*/
select product, sum(total)
from sales_processed
where order_date BETWEEN '2019-01-01' and '2019-12-31'
group by product
order by 2 desc;

/*Total Products in Year 2019 in the West Region on the Weekends*/
select product, sum(total)
from sales_processed
where order_date BETWEEN '2019-01-01' and '2019-12-31'
AND region = 'west'
AND datename(weekday, order_date) in ('Saturday', 'Sunday')
group by product
order by 2 desc;

/*Total Category Region Cube in Year 2019*/
select category, region, sum(total)
from sales_processed
where order_date BETWEEN '2019-01-01' and '2019-12-31'
group by cube (category, region)

/*IBM2 Join Series*/
SELECT factsales.countryid, count(*)
FROM factsales
LEFT JOIN dimcountry
ON factsales.countryid = dimcountry.countryid
GROUP BY factsales.countryid

/*IBM2 Sub-Query */
SELECT countryid, sum(amount)
FROM factsales
WHERE countryid = (SELECT countryid
					FROM dimcountry
					WHERE country = 'France')
GROUP BY countryid

