/*
RANK()
Problema de negócio
Criar ranking de vendedores.
Empates devem compartilhar posição.
*/

select
	s.company_name as vendedor,
	sum(o.unit_price * o.quantity * (1 - o.discount)) as vendas,
	rank() over(order by sum(o.unit_price * o.quantity * (1 - o.discount)) desc) as ranking
from suppliers s
join products p on p.supplier_id = s.supplier_id
join order_details o on o.product_id = p.product_id
group by s.company_name

