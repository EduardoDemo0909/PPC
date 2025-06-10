

Create table funcionarios(
	id serial primary key,
	nome varchar (255) not null,
	funcao varchar (255),
	em_atividade boolean
);


Create table projeto(
	id serial primary key,
	meta varchar (255),
	trabalhando_em varchar (255),
	em_desenvolvimento boolean,
	concluido boolean
);

drop table projeto

insert into funcionarios (id, nome, funcao, em_atividade) values  (1, 'Stukov', 'Diretor_do_projeto', True),
																  (2, 'Arroz', 'Programador', True),
																  (3, 'Vitogama', 'Programador', True),
																  (4, 'Demo', 'Matemático/Físico', True),
																  (5, 'ely', 'Desginer', False),
																  (6, 'Kyllb', null, False),
																  (7, 'Nick', null, False),
																  (8, 'Tokarev', null, False);
																  
INSERT INTO estagio2 (id, meta, trabalhando_em, status, prioridade, concluido) VALUES (9, 'Design dos imóveis', NULL, false, 'Média', False);

select * from estagios
select * from estagio1	
select * from estagio2
select * from estagio3
select * from estagio4			
				
				

Create table atividade (
	estagio1_id integer,
	estagio2_id integer,
	estagio3_id integer,
	estagio4_id integer,
	primary key (estagio1_id, estagio2_id, estagio3_id, estagio4_id),
	
	
	
	
	
);



UPDATE estagio3
SET status = 'True'
WHERE id = 2;


