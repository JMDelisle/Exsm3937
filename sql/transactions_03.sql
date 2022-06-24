/* Query 01 */
SELECT customer_name, COUNT(order_header_id)
FROM customer 
INNER JOIN order_header on customer.customer_id = order_header.customer_id
GROUP BY customer.customer_id
ORDER BY COUNT(order_header_id) DESC, customer_name;

/* Query 02 */
SELECT customer_name AS Customer, CONCAT('$', SUM(total_price)) AS `Sum of Purchase Totals`
FROM customer 
INNER JOIN order_header on customer.customer_id = order_header.customer_id
GROUP BY customer.customer_id
ORDER BY SUM(total_price) DESC, customer_name;

/* Query 03 */

SELECT SUM(order_qty) AS `Number of Products Sold`, product_name
FROM order_detail
INNER JOIN product on order_detail.product_id = product.product_id
GROUP BY product.product_name
ORDER BY SUM(order_qty) DESC, product_name ASC;

/* Query 04 */
SELECT order_header.order_header_id, product.product_name, order_detail.order_qty, customer.customer_name, order_header.order_date, order_header.total_price
FROM order_header
INNER JOIN product on order_header.product_name = product.product_name
INNER JOIN order_detail on order_header.order_qty = order_detail.order_qty
INNER JOIN customer on order_header.customer_id = customer.customer_name



SELECT order_header.order_header_id, product.product_name, order_detail.order_qty, customer.customer_name, order_header.order_date, order_header.total_price
From Order_Header
    INNER JOIN





SELECT order_header.order_header_id, product.product_name, order_detail.order_qty, customer.customer_name, order_header.order_date, order_header.total_price
FROM order_header
INNER JOIN product on order_header.product_name = product.product_name
INNER JOIN order_detail on order_header.order_qty = order_detail.order_qty
INNER JOIN customer on order_header.customer_id = customer.customer_name

WHERE order_header.order_date =< 2022-01-07;

/* Query 05 */