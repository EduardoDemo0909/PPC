
CREATE DATABASE restaurante





						
								drop table Clientela
								drop table pedidos
								drop table pagamentos

								truncate Clientela
								truncate pedidos
								truncate pagamentos

								select * from pedidos
								select * from planilha -- ver planilha completa
								select * from contagem -- ver a contagem de pedidos de cada cliente
								select * from cupom -- ver a promoção dos pedidos

								SELECT valor,  --Cupom de desconto
									valor * 0.10 AS desconto_10_porcento,
									valor - (valor * 0.10) AS valor_com_desconto
									FROM pedidos;

								SELECT pedido, solicitacao
									FROM pedidos
									WHERE solicitacao BETWEEN '2023-01-01' AND '2023-12-31';


								create view planilha as
								SELECT
									pedidos.pedido,
									pagamentos.cliente, 
									pedidos.solicitacao AS solicitado_em,
									pedidos.comida,
									pagamentos.pago_em AS pago_em,
									pedidos.valor
								FROM pagamentos
										JOIN Clientela 
											ON Clientela.pagamentos_id = pagamentos.id 
										JOIN pedidos 
											ON pedidos.id = Clientela.pedidos_id;


								create view contagem as
								SELECT
									pagamentos.cliente,
									COUNT(pedidos.pedido) AS quantidade_pedidos, 
									MAX(pedidos.solicitacao) AS max_solicitado_em,
									MAX(pagamentos.pago_em) AS max_pago_em 
								FROM pagamentos
										JOIN Clientela 
											ON Clientela.pagamentos_id = pagamentos.id 
										JOIN pedidos 
											ON pedidos.id = Clientela.pedidos_id
									GROUP BY pagamentos.cliente;

								select * from pedidos
									union all
								select * from pagamentos;


								create view cupom as
								SELECT valor,
									CASE
										WHEN valor < 50 THEN 'promoção de 10%'
										WHEN valor >= 50 AND valor < 150 THEN 'promoção de 15%'
										ELSE 'sem desconto'
									END AS categoria_valores
								FROM pedidos;

								SELECT comida
								FROM pedidos 
								WHERE comida (SELECT pedido FROM pedidos WHERE pedido = 'Pedido 1');
								
								SELECT comida
								FROM pedidos
								WHERE pedido = 'Pedido 1';



							
--------------------------------------------------------------------------------------------------------------------------------

	
	
CREATE TABLE pedidos (
    ID serial PRIMARY KEY,
    pedido VARCHAR(255), 
    solicitacao DATE
);
CREATE TABLE pagamentos (
    id serial PRIMARY KEY,
    cliente varchar(255),
	pago_em DATE

);

			ALTER TABLE pedidos
			ADD valor numeric;

			ALTER TABLE pedidos
			ADD comida varchar;	
	
	

create table Clientela(
	pedidos_id integer,
	pagamentos_id integer,
	primary key(pedidos_id, pagamentos_id),

	foreign key (pedidos_id)
	references pedidos (id) 
	on update cascade,
	
	foreign key (pagamentos_id)
	references pagamentos (id)
	on update cascade 

);

--------------------------------------------------------------------------------------------------------------------------------

insert into Clientela (pedidos_id, pagamentos_id) values (1, 1);
insert into Clientela (pedidos_id, pagamentos_id) values (2, 2);
insert into Clientela (pedidos_id, pagamentos_id) values (4, 4);
insert into Clientela (pedidos_id, pagamentos_id) values (5, 5);
insert into Clientela (pedidos_id, pagamentos_id) values (6, 6);
insert into Clientela (pedidos_id, pagamentos_id) values (7, 7);
insert into Clientela (pedidos_id, pagamentos_id) values (8, 8);
insert into Clientela (pedidos_id, pagamentos_id) values (9, 9);
insert into Clientela (pedidos_id, pagamentos_id) values (10, 10);


INSERT INTO pedidos (pedido, solicitacao, comida, valor)
VALUES
    ('Pedido 1', '2023-11-08', 'Pizza Margherita',  60.0),
    ('Pedido 2', '2023-11-09', 'Lasanha', 30.0),
    ('Pedido 4', '2023-11-11', 'Risoto de Cogumelos', 37.0),
    ('Pedido 5', '2023-11-12', 'Ravioli', 47.0),
    ('Pedido 6', '2023-11-13', 'Focaccia', 67.0),
    ('Pedido 7', '2023-11-14',  'Osso Buco', 120.0),
    ('Pedido 8', '2023-11-15',  'Tiramisu', 89.0),
    ('Pedido 9', '2023-11-16',  'Gnocchi', 55.0),
    ('Pedido 10', '2023-11-17',  'Polenta', 60.0);


INSERT INTO pagamentos (cliente, pago_em)
VALUES
    ('Eduardo', '2023-11-08'),
    ('Pablo', '2023-11-09'),
    ('Lucas', '2023-11-11'),
    ('Gabriel', '2023-11-12'),
    ('Victor', '2023-11-13'),
    ('Lívia', '2023-11-14'),
    ('Ruan', '2023-11-15'),
    ('Matheus', '2023-11-16'),
    ('Kevin', '2023-11-17');


--------------------------------------------------------------------------------------------------------------------------------






