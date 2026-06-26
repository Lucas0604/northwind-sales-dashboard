/*
Problema de negócio
Quais produtos possuem preço acima da média dos produtos?
*/
select
	p.product_name,
	p.unit_price
from products p
where p.unit_price > (select avg(unit_price) from products);

