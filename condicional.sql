use restaurante;

select * from pedidos where id_funcionario = 4
and status = 'Pendente';  -- consulta sobre pedidos pendentes do funcionario 4

select * from pedidos where
 status not like 'Concluido';  -- filtro de pedios não concluídos

select id_pedido, id_produto from pedidos where
 id_produto in (1,3,5,7,8);
 
 select nome from clientes where nome like 'C%';

select * from info_produtos where ingredientes like 'carne%';  -- Pesquisas sobre produtos que contenham carne e frango
select * from info_produtos where ingredientes like 'frango%';

select nome, preço from produtos where preço between 20 and 30;

update pedidos
set status = null   -- mudando status do pedido 6 para null
where id_pedido = 6;

select * from pedidos where status is null;

select id_pedido, status, ifnull(status, 'Cancelado') as status_att from pedidos;

select 
   nome,
   cargo,
   salário,
   case
      when salário > 3000 then 'Acima da Média'
	  else 'Abaixo da Média' 
      end as media_salário
  from funcionarios;   

