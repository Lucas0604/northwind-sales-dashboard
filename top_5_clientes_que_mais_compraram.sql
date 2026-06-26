/*
Problema de negócio
Mostrar os 5 clientes que mais compraram.
Retornar:
Posição
Cliente
Receita
*/
select
	row_number() over(order by sum(od.unit_price * od.quantity * (1 - od.discount)) desc) as ranking,
	c.company_name as cliente,
	sum(od.unit_price * od.quantity * (1 - od.discount)) as receita
from customers c
join orders o on o.customer_id = c.customer_id
join order_details od on od.order_id = o.order_id
group by cliente
limit 5;








