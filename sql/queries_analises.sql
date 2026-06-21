USE financeiro_varejo;
/*Receita mensal*/
SELECT 
	DATE_FORMAT(data_venda, '%Y-%m') AS ano_mes,
    DATE_FORMAT(data_venda, '%b/%Y') AS mes_label,
    COUNT(id) AS total_vendas,
    SUM(valor_total) AS receita_bruta,
    SUM(CASE WHEN status = 'Paga' THEN valor_total ELSE 0 END) AS receita_recebida,
    SUM(CASE WHEN status IN ('Pendente', 'Atrasada') THEN valor_total ELSE 0 END) AS receita_em_risco
FROM vendas
WHERE status != 'Cancelada'
GROUP BY DATE_FORMAT(data_venda, '%Y-%m'), DATE_FORMAT(data_venda, '%b/%Y')
ORDER BY ano_mes;

/*Despesas mensais por categoria*/
SELECT 
	DATE_FORMAT(data_despesa, '%Y-%m') AS ano_mes,
    DATE_FORMAT(data_despesa, '%b/%Y') AS mes_label,
    categoria,
    SUM(valor) AS total_despesa
FROM despesas
GROUP BY DATE_FORMAT(data_despesa, '%Y-%m'), DATE_FORMAT(data_despesa, '%b/%Y'), categoria
ORDER BY ano_mes, categoria;

/*DRE simplificado (Resultado por mês)*/
SELECT 
	v.ano_mes,
    v.mes_label,
    v.receita_bruta,
    d.total_despesas,
    v.receita_bruta - d.total_despesas AS lucro_bruto,
    ROUND((v.receita_bruta - d.total_despesas) / v.receita_bruta * 100, 2) AS margem_percent
FROM (
	SELECT
		DATE_FORMAT(data_venda, '%Y-%m') AS ano_mes,
        DATE_FORMAT(data_venda, '%b/%Y') AS mes_label,
        SUM(valor_total) AS receita_bruta
	FROM vendas
    WHERE status != 'Cancelada'
    GROUP BY DATE_FORMAT(data_venda, '%Y-%m'), DATE_FORMAT(data_venda, '%b/%Y')
) v
JOIN (
	SELECT
		DATE_FORMAT(data_despesa, '%Y-%m') AS ano_mes,
        SUM(valor) AS total_despesas
	FROM despesas
    GROUP BY DATE_FORMAT(data_despesa, '%Y-%m')
) d ON v.ano_mes = d.ano_mes
ORDER BY v.ano_mes;

/*Análise de inadimplência por cliente*/
SELECT
	c.nome,
    c.segmento,
    c.cidade,
    c.estado,
    COUNT(v.id) AS total_compras,
    SUM(v.valor_total) AS valor_total_compras,
    SUM(CASE WHEN v.status = 'Atrasada' THEN v.valor_total ELSE 0 END) as valor_atrasado,
    SUM(CASE WHEN v.status = 'Pendente' THEN v.valor_total ELSE 0 END) AS valor_pendente,
    ROUND(
		SUM(CASE WHEN v.status IN ('Atrasada', 'Pendente') THEN v.valor_total ELSE 0 END) / SUM(v.valor_total) * 100, 2
	) AS percentual_inadimplencia
FROM clientes c
JOIN vendas v ON c.id = v.cliente_id
GROUP BY c.id, c.nome, c.segmento, c.cidade, c.estado
ORDER BY valor_atrasado DESC;

/*Produtos mais vendidos com margem*/
SELECT 
	p.nome AS produto,
    p.categoria,
    p.custo,
    p.preco_venda,
    ROUND(p.preco_venda - p.custo, 2) as margem_unitaria,
    round((p.preco_venda - p.custo) / p.preco_venda * 100, 2) as margem_percent,
    sum(iv.quantidade) as unidades_vendidas,
    sum(iv.quantidade * iv.preco_unitario) as receita_gerada,
    sum(iv.quantidade * p.custo) as custo_total,
    sum(iv.quantidade * (iv.preco_unitario - p.custo)) as lucro_gerado
FROM produtos p
join itens_venda iv on p.id = iv.produto_id
join vendas v on iv.venda_id = v.id
where v.status != 'Cancelada'
group by p.id, p.nome, p.categoria, p.custo, p.preco_venda
order by lucro_gerado desc;

/*Visão Geral*/
select 
	sum(case when status != 'Cancelada' then valor_total else 0 end) as receita_total_ano,
    sum(case when status = 'Paga' then valor_total else 0 end) as receita_recebida,
    sum(case when status = 'Atrasada' then valor_total else 0 end) as total_inadimplente,
    count(case when status = 'Atrasada' then 1 end) as vendas_atrasadas,
    count(case when status != 'Cancelada' then 1 end) as total_vendas,
    round(
		sum(case when status = 'Atrasada' then valor_total else 0 end) /
        sum(case when status != 'Cancelada' then valor_total else 0 end) * 100, 2
	) as taxa_inadimplencia_percent
from vendas;

SELECT total_inadimplente FROM (
  SELECT
    SUM(CASE WHEN status != 'Cancelada' THEN valor_total ELSE 0 END) AS receita_total_ano,
    SUM(CASE WHEN status = 'Paga' THEN valor_total ELSE 0 END) AS receita_recebida,
    SUM(CASE WHEN status = 'Atrasada' THEN valor_total ELSE 0 END) AS total_inadimplente,
    COUNT(CASE WHEN status = 'Atrasada' THEN 1 END) AS vendas_atrasadas,
    COUNT(CASE WHEN status != 'Cancelada' THEN 1 END) AS total_vendas,
    ROUND(
      SUM(CASE WHEN status = 'Atrasada' THEN valor_total ELSE 0 END) /
      SUM(CASE WHEN status != 'Cancelada' THEN valor_total ELSE 0 END) * 100, 2
    ) AS taxa_inadimplencia_percent
  FROM vendas
) t;