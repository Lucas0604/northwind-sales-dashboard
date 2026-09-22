--Faturamento por mês
select
	to_char(o.order_date, 'YYYY-MM') as ano_mes,
	sum(od.unit_price * od.quantity * (1 - od.discount)) as faturamento_total
from orders o
join order_details od on od.order_id = o.order_id
group by to_char(o.order_date, 'YYYY-MM')
order by ano_mes;

--usando o TRUNC
SELECT
    DATE_TRUNC('month', o.order_date) AS mes,
    SUM(od.unit_price * od.quantity * (1 - od.discount)) AS faturamento_total
FROM orders o
JOIN order_details od ON od.order_id = o.order_id
GROUP BY DATE_TRUNC('month', o.order_date)
ORDER BY mes;
