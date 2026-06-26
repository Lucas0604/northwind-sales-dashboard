/*
Problema de negócio
Qual categoria possui o maior faturamento?
Utilize uma subquery.
*/

--Categoria com maior faturamento
SELECT 
    categoria,
    faturamento_total
FROM (
    -- Subquery: Calcula o faturamento total de cada categoria
    SELECT 
        c.category_name AS categoria,
        SUM(od.unit_price * od.quantity * (1 - od.discount)) AS faturamento_total
    FROM categories c
    JOIN products p ON c.category_id = p.category_id
    JOIN order_details od ON p.product_id = od.product_id
    GROUP BY c.category_name
) AS FaturamentoPorCategoria
ORDER BY faturamento_total DESC
LIMIT 1;

--Categoria com menor faturamento

select
	categoria,
	faturamento
from (
	select 
		c.category_name as categoria,
		sum(od.unit_price * od.quantity * (1 - od.discount)) as faturamento
	from categories c
	join products p on p.category_id = c.category_id
	join order_details od on od.product_id = p.product_id
	group by c.category_name
) as faturamento_por_categoria
order by faturamento asc
limit 1;


