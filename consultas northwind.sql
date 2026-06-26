--Mostrar pedidos e clientes.
SELECT 
	cus.*,
	ord.*
FROM orders ord
JOIN customers cus
	on ord.customer_id = cus.customer_id;

--Calcular faturamento por cliente.
SELECT
	cus.company_name,
	SUM(ordd.unit_price * ordd.quantity * (1 - ordd.discount)) as faturamento_total
FROM customers cus
JOIN orders ord ON ord.customer_id = cus.customer_id
JOIN order_details ordd ON ordd.order_id = ord.order_id
GROUP BY cus.company_name
ORDER BY faturamento_total DESC;

--Identificar os produtos mais vendidos.
SELECT 
	prod.product_name,
	SUM(ordd.quantity) as quantidade_vendida
FROM products prod
JOIN order_details ordd on ordd.product_id = prod.product_id
GROUP BY prod.product_name
ORDER BY quantidade_vendida DESC;

--Criar ranking de vendedores.
SELECT 
	CONCAT(emp.first_name, ' ', emp.last_name) as nome_completo,
	SUM(ordd.quantity) as quantidade_total,
	DENSE_RANK() OVER (ORDER BY SUM(ordd.quantity) DESC) as ranking
FROM employees emp
JOIN orders ord ON ord.employee_id = emp.employee_id
JOIN order_details ordd ON ordd.order_id = ord.order_id
GROUP BY emp.employee_id, emp.first_name, emp.last_name;




