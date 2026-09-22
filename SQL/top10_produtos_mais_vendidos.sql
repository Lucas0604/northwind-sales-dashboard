/*
Problema de negócio
Criar uma CTE para calcular:
Produto
Quantidade Vendida

E depois retornar apenas:
Top 10
*/


with vendas_produtos as (
	select
		p.product_name as Produto,
		sum(od.quantity) as Quantidade_Vendida
	from products p
	join order_details od on od.product_id = p.product_id
	group by Produto
)
select 
	Produto,
	Quantidade_Vendida
from vendas_produtos
order by Quantidade_Vendida desc
limit 10;







