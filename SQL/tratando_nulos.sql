/*
Problema de negócio
A empresa identificou clientes sem telefone.
Retorne:
Cliente
Telefone

Se telefone for nulo:
Telefone não informado

Utilize:
COALESCE()

*/

select * from customers;

selecT
	company_name,
	coalesce(fax, 'Não informado') as telefone
from customers;








