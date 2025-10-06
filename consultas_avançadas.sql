use restaurante;

-- 1
create view resumo_pedido as 
select pe.id_pedido, c.nome as cliente, c.email, p.nome as produto, p.preço, pe.quantidade, fc.nome as funcionário
from pedidos pe
join clientes c on pe.id_cliente = c.id_cliente
join produtos p on pe.id_produto = p.id_produto
join funcionarios fc on pe.id_funcionario = fc.id_funcionario
group by pe.id_pedido;

select * from resumo_pedido limit 20;

-- 2
select pe.id_pedido, c.nome, sum(pe.quantidade * p.preço) as total_pedido
from pedidos pe
left join clientes c on pe.id_cliente = c.id_cliente
left join produtos p on pe.id_produto = p.id_produto
group by pe.id_pedido;

-- 3
create or replace view resumo_pedido as 
select pe.id_pedido,
 c.nome as cliente,
 c.email,
 p.nome as produto,
 p.preço, 
 pe.quantidade, 
 fc.nome as funcionário, 
 sum(pe.quantidade * p.preço) as total_pedido
from pedidos pe
join clientes c on pe.id_cliente = c.id_cliente
join produtos p on pe.id_produto = p.id_produto
join funcionarios fc on pe.id_funcionario = fc.id_funcionario
group by pe.id_pedido;

-- 4
select * from resumo_pedido order by(total_pedido) desc limit 10;

-- 5 
explain
select * from resumo_pedido order by(total_pedido) desc limit 10;

-- 6
delimiter //
create function BuscaIngredientesProduto(ProdutoID int)
returns text
reads SQL data
begin
  declare ingredientes_presentes text;
  Select ingredientes into ingredientes_presentes from info_produtos 
  where id_produto = ProdutoID;
  return ingredientes_presentes;
end //
delimiter ;


-- 7 
select BuscaIngredientesProduto(10);

-- 8
delimiter //
create function MediaPedido(PedidoID int)
returns varchar(200)
reads sql data
begin 
  declare total decimal(10, 2);
  declare media decimal(10, 2);
  declare desempenho varchar(100);
  
   select sum(p.preço * pe.quantidade) into total 
   from produtos p
   left join pedidos pe on p.id_produto = pe.id_produto
   where id_pedido = PedidoID;
   
   select avg(p.preço * pe.quantidade) into media from produtos p
   join pedidos pe on p.id_produto = pe.id_produto;
   
   set desempenho = 
   case
     when total < media then 'abaixo da média'
     when total = media then 'na média'
     else 'acima da média'
   end;
   
return desempenho;
end //
delimiter ;

-- 9
select MediaPedido(5);
select MediaPedido(6);