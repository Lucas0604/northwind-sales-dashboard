/*
Problema de negócio
Quais clientes nunca fizeram pedidos?
Tabelas:
customers
orders

Dica:
LEFT JOIN
WHERE orders.order_id IS NULL
*/

select * 
from customers cus
left join orders ord on ord.customer_id = cus.customer_id
where ord.order_id is null




