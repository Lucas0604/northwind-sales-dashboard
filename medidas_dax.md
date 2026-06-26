## Receita Total
```DAX
Receita Total = 
SUMX(
    Detalhes_Pedido,
    Detalhes_Pedido[Preco_Unitario] * Detalhes_Pedido[Quantidade] * (1 - Detalhes_Pedido[Desconto])
)
```

## Ticket Médio
```DAX
Ticket Medio =
DIVIDE([Receita Total], [Base de Clientes], 0)
```

## Base de Clientes
```DAX
Base de Clientes =
DISTINCTCOUNT(Clientes[Cliente_ID])
```

## Volume de Vendas
```DAX
Volume de Vendas = 
SUM(Detalhes_Pedido[Quantidade])
```

## vs Mês Anterior
```DAX
vs Mês Anterior = 
VAR ReceitaAtual = [Receita Total]
VAR ReceitaAnterior = [Receita Mês Anterior Corrigida]
RETURN 
DIVIDE(ReceitaAtual - ReceitaAnterior, ReceitaAnterior, 0)
```

## Quantidade Vendida 
```DAX
Quantidade Vendida = 
SUM(Detalhes_Pedido[Quantidade])
```

## Quantidade Vendida 
```DAX
Receita Mês Anterior = 
VAR DataAtual = MAX('Calendario'[Date])
RETURN
CALCULATE(
    [Receita Total],
    DATEADD('Calendario'[Date], -1, MONTH),
    REMOVEFILTERS('Calendario') -- Remove o filtro do mês atual para buscar o anterior
)
```


