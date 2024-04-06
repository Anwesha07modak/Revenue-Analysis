SELECT 
     ord.order_id,
	 CONCAT(cus.first_name,' ',cus.last_name) AS 'customers',
	 cus.city,
	 cus.state,
	 ord.order_date,
	 SUM(item.quantity) AS 'total_units',
	 SUM(item.quantity * item.list_price) AS 'revenue',
	 prd.product_name,
	 pcat.category_name,
	 stre.store_name,
	 CONCAT(stf.first_name, ' ', stf.last_name) AS 'sales_rep',
	 pbrnd.brand_name,
	 ord.shipped_date
FROM sales.orders ord
JOIN sales.customers cus
ON ord.customer_id = cus.customer_id
JOIN sales.order_items item
ON  ord.order_id = item.order_id
JOIN production.products prd
ON item.product_id = prd.product_id
JOIN production.categories pcat
ON prd.category_id = pcat.category_id
JOIN sales.stores stre
ON ord.store_id = stre.store_id
JOIN sales.staffs stf
ON ord.staff_id = stf.staff_id
JOIN production.brands pbrnd
ON prd.brand_id = pbrnd.brand_id

GROUP BY 
     ord.order_id,
	 CONCAT(cus.first_name,' ',cus.last_name),
	 cus.city,
	 cus.state,
	 ord.order_date,
	 prd.product_name,
	 pcat.category_name,
	 stre.store_name,
	 CONCAT(stf.first_name, ' ', stf.last_name),
	 pbrnd.brand_name,
	 ord.shipped_date

	 



