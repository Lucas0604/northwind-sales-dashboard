/*
Problema de negócio
Quais clientes gastaram acima da média?
Passos:
1.	Calcular gasto por cliente
2.	Comparar com média geral
*/

--Gasto por cliente
with gastos_clientes as (
	select
		cus.company_name as cliente,
		sum(ordd.unit_price * ordd.quantity * (1 - ordd.discount)) as gastos
	from customers cus
	join orders ord on ord.customer_id = cus.customer_id
	join order_details ordd on ordd.order_id = ord.order_id
	group by cus.company_name
)
select 
	cliente,
	gastos
from gastos_clientes
where gastos > (select avg(gastos) from gastos_clientes)
order by gastos desc;
