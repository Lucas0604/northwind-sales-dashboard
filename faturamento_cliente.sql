--Problema de negócio
--A empresa quer classificar os clientes pelo faturamento.
--Cliente Ouro: acima de 10.000
--Cliente Prata: entre 5.000 e 10.000
--Cliente Bronze: abaixo de 5.000
--Desafio:
--Retorne:
--Cliente
--Receita Total
--Categoria Cliente

select * from customers;

with faturamento_cliente as (
	select
		cus.company_name as Cliente,
		SUM(ordd.unit_price * ordd.quantity * (1 - ordd.discount)) as Faturamento
	from customers cus
	join orders ord on ord.customer_id = cus.customer_id
	join order_details ordd on ordd.order_id = ord.order_id
	group by Cliente
)
select 
	Cliente,
	Faturamento,
	case
		when Faturamento > 10000 then 'Cliente Ouro'
		when Faturamento > 5000 and Faturamento < 10000 then 'Cliente Prata'
		else 'Cliente Bronze'
		end as Categoria_Cliente
from faturamento_cliente
order by Faturamento desc;












