use restaurante;

-- 1
select p.id_produto, p.nome, p.descricao, ip.ingredientes
from produtos p 
join info_produtos ip on p.id_produto = ip.id_produto;

-- 2
select pe.id_pedido, pe.quantidade, c.nome, c.email
from clientes c
join pedidos pe on c.id_cliente = pe.id_cliente;

-- 3
select c.nome as cliente, c.email, f.nome as funcionario, pe.quantidade, pe.id_pedido
from clientes c
left join pedidos pe on c.id_cliente = pe.id_cliente
left join funcionarios f on pe.id_funcionario = f.id_funcionario
where id_pedido is not null;

-- 4
select c.nome as cliente, c.email, f.nome as funcionario, pe.quantidade, pe.id_pedido, p.nome as produto, p.preço
from clientes c
join pedidos pe on c.id_cliente = pe.id_cliente
join funcionarios f on pe.id_funcionario = f.id_funcionario
join produtos p on pe.id_produto = p.id_produto;

-- 5 
select pe.id_pedido, c.nome, pe.status
from clientes c 
join pedidos pe on c.id_cliente = pe.id_cliente
where pe.status = 'pendente'
order by (id_pedido) desc;

-- 6 (clientes sem pedidos)
select distinct c.nome, pe.id_pedido
from clientes c
left join pedidos pe on c.id_cliente = pe.id_cliente
where pe.id_pedido is null;

-- 7
select nome,
	(select count(*) from pedidos where pedidos.id_cliente = clientes.id_cliente) as total_pedidos
from clientes
order by(total_pedidos) desc;

-- 8
select pe.id_pedido, sum(pe.quantidade * p.preço) as total_pedido from pedidos pe
join produtos p on pe.id_produto = p.id_produto
group by id_pedido
order by (total_pedido) desc;