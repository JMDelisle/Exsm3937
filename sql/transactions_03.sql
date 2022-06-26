START TRANSACTION;
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
FROM product
	INNER JOIN Order_Detail on Order_Detail.product_id = Product.product_id
    INNER JOIN Order_Header ON Order_Header.order_header_id = Order_Detail.order_header_id
    INNER JOIN Customer ON Customer.customer_id = Order_Header.customer_id
    WHERE order_date BETWEEN '2022-01-01' AND '2022-01-07'
    ORDER BY order_header_id;

    /* Query 05 */

SELECT
    SUM(Order_Detail.order_qty) AS 'Number of Guitars Sold'
FROM
    Product
    JOIN Order_Detail ON Order_Detail.product_id = Product.product_id
WHERE
    Product.product_name LIKE '%Guitar%';
    
    
    
    
    

/*LAST QUESTION */

UPDATE
    Product
SET
    quantity_in_stock = Product.quantity_in_stock - (
        SELECT
            Order_Detail.order_qty
        FROM
            Order_Detail
        WHERE
            Order_Detail.order_header_id = 8
            AND Order_Detail.product_id = 4
    )
WHERE
    Product.product_id = 4 AND Product.product_name = 'Bass Guirat';

UPDATE
    Product
SET
    quantity_in_stock = Product.quantity_in_stock - (
        SELECT
            Order_Detail.order_qty
        FROM

        COMMIT;