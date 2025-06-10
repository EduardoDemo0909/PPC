CREATE TABLE fabrica(
	id serial primary key,
	nome_produto varchar (255),
	quantidade_produzida numeric (10),
	setor_fabricado varchar (255)

);

CREATE TABLE valores(
	id serial primary key,
	valor_p_unidade numeric (10, 2) not null,
	valor_cliente numeric (10, 2) not null
);

CREATE TABLE planilha_total(
	fabrica_id integer,
	valores_id integer,
	primary key(fabrica_id, valores_id),

	foreign key (fabrica_id)
	references fabrica (id)
	on update cascade,
	
	foreign key (valores_id)
	references valores(id)
	on update cascade

);


create view produto as												
select  fabrica.id,
	    fabrica.nome_produto,
		fabrica.quantidade_produzida,
		fabrica.setor_fabricado,
		valores.valor_p_unidade,
		valores.valor_cliente
	FROM valores
		JOIN planilha_total 
			ON planilha_total.valores_id = valores.id
		JOIN fabrica
			ON fabrica.id = planilha_total.fabrica_id 
	ORDER BY valor_p_unidade ASC;
	
	
	
create view desconto as	
SELECT valor_p_unidade,  
		valor_p_unidade * 0.10 AS desconto_10_porcento,
		valor_p_unidade - (valor_p_unidade * 0.10) AS valor_com_desconto
		FROM valores;
		
		
SELECT id, valor_p_unidade FROM valores WHERE valor_p_unidade BETWEEN 30.00 AND 70.00;		
		
select * from produto
select * from desconto



INSERT INTO planilha_total (fabrica_id, valores_id) VALUES  (1, 1), 
															(2, 2),
															(3, 3),
															(4, 4),
															(5, 5),
															(6, 6),
															(7, 7),
															(8, 8),
															(9, 9),
															(10, 10),
															(11, 11),
															(12, 12),
															(13, 13),
															(14, 14);
															

	





INSERT INTO valores (id, valor_p_unidade, valor_cliente ) values   (1, 1.45, 1.00),
																	(2, 56.38, 40.60),
																	(3, 56.38, 40.60),
																	(4, 33.78, 25.00),
																	(5, 29.60, 20.00),
																	(6, 52.62, 40.00),
																	(7, 26.80, 20.00),
																	(8, 3.00, 2.50),
																	(9, 22.35, 20.00),
																	(10, 68.33, 60.00 ),
																	(11, 200.00, 190.00),
																	(12, 200.00, 190.00),
																	(13, 56.40, 55.00),
																	(14, 60.55, 60.65);


INSERT INTO fabrica (id, nome_produto, quantidade_produzida, setor_fabricado) 
VALUES (1, 'tijolo', 1000, 'setor 1'), 
(2, 'cimento vitoran 50kg', 1000, 'setor 2'),
(3, 'concreto', 1233, 'setor 2'),
(4, 'Tintas e revestimentos tigre', 9022, 'setor 3'),
(5, 'Drywall', 3000, 'setor 4'),
(6, 'Isolamento térmico e acústico', 8000, 'setor 4'),
(7, 'Ferragens',10000 ,'setor 5'),
(8, 'Tubos e conexões',1853 ,'setor 5'),
(9, 'Adesivos e selantes', 9939, 'setor 5'),
(10, 'Telhas metálicas', 9099, 'setor 6'),
(11, 'Alvenaria', 9088, 'setor 6'),
(12, 'Lajes pré-fabricadas', 9052, 'setor 6'),
(13, 'Luminárias', 6200, 'setor 6'),
(14, 'Pisos e revestimentos', 2658, 'setor 6');

SELECT * FROM fabrica;






																					 