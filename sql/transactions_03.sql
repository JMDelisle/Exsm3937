/* Query 01 */
SELECT customer_name, COUNT(order_header_id)
FROM customer 
INNER JOIN order_header on customer.customer_id = order_header.customer_id
GROUP BY customer.customer_id
ORDER BY COUNT(order_header_id) DESC, customer_name;

/* Query 02 */
SELECT customer_name AS Customer, SUM(total_price) AS `Sum of Purchase Totals`
FROM customer 
INNER JOIN order_header on customer.customer_id = order_header.customer_id
GROUP BY customer.customer_id
ORDER BY SUM(total_price) DESC, customer_name;

/* Query 03 */

SELECT product_name AS Product, COUNT(order_qty) AS `Number of Products Sold`
FROM product
INNER JOIN order_qty ON product.product_name = order_detail.order_qty
GROUP BY product.product_name
ORDER By COUNT(order_qty) DESC, product_name; 



SELECT product.name, order_detail.order_qty, COUNT(order_qty)
    FROM product
    INNER JOIN productsubcategory on product.name=productsubcategory.ProductCategoryID
    INNER JOIN product on productsubcategory.ProductSubcategoryID=product.ProductSubcategoryID
WHERE product.DiscontinuedDate IS NULL
GROUP BY product.name, order_detail.order_qty;

/* Query 04 */