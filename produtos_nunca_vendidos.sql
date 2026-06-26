/*
Quais produtos nunca foram vendidos?
Tabelas:
products
order_details

Subqueries
*/

SELECT 
    p.product_id, 
    p.product_name
FROM products p
LEFT JOIN order_details od ON p.product_id = od.product_id
WHERE od.product_id IS NULL;
--com subqueries
SELECT 
    product_id, 
    product_name
FROM products
WHERE product_id NOT IN (
    SELECT DISTINCT product_id 
    FROM order_details 
    WHERE product_id IS NOT NULL
);



