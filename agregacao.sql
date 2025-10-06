use restaurante;

select count(*) from pedidos; -- contagem de pedidos realizados

select count(distinct id_cliente) from pedidos;

select round(avg(preço), 2) from produtos; -- média de preços dos produtos com apenas 2 casas decimais

select max(preço) from produtos;
select min(preço) from produtos;

select nome, preço, rank() over (order by preço desc) from produtos limit 5;

select categoria, round(avg(preço), 2) as media_preço from produtos group by categoria;

select fornecedor, count(id_produto) as cont_fornecedor from info_produtos group by fornecedor;

select fornecedor, count(id_produto) from info_produtos group by fornecedor having count(id_produto) > 1;

select id_cliente, count(id_pedido) as quant_pedidos from pedidos group by id_cliente having count(id_pedido) = 1;