/*
Problema de negócio
A diretoria quer visualizar:
Cliente
Receita Total
Ranking

Primeiro calcule a receita.
Depois use uma CTE.
WITH receita_cliente AS (...)
*/

with receita_cliente as (
	select
		cus.company_name as cliente,
		sum(od.unit_price * od.quantity * (1 - od.discount)) as receita_total,
		dense_rank() over (order by sum(od.unit_price * od.quantity * (1 - od.discount)) desc) as ranking
	from customers cus
	join orders ord on ord.customer_id = cus.customer_id
	join order_details od on od.order_id = ord.order_id
	group by cliente
)
select 
	cliente,
	receita_total,
	ranking
from receita_cliente;
