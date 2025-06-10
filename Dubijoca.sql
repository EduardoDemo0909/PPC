SELECT table_schema, table_name
FROM information_schema.tables
WHERE table_name IN ('funcionarios', 'estagios');




Create table funcionarios(
	id serial primary key,
	nome varchar (255) not null,
	team varchar (255) not null,
	funcao varchar (255),
	em_atividade boolean
);


CREATE TABLE estagios (
    id serial primary key,
    estagio_nome varchar(255)
);


INSERT INTO estagios (id, estagio_nome) VALUES  
    (1, 'Estágio 1 - Player'),
    (2, 'Estágio 2 - Mapa Alpha'),
    (3, 'Estágio 3 - Itens'),
    (4, 'Estágio 4 - Veículos');


Create table Estagio1(
	id serial primary key,
	meta varchar (255),
	trabalhando_em varchar (255),
	status boolean,
	prioridade varchar (255),
	concluido boolean 
);

Create table Estagio2(
	id serial primary key,
	meta varchar (255),
	trabalhando_em varchar (255),
	status boolean,
	prioridade varchar (255),
	concluido boolean 
);
Create table Estagio3(
	id serial primary key,
	meta varchar (255),
	trabalhando_em varchar (255),
	status boolean,
	prioridade varchar (255),
	concluido boolean 
);

Create table Estagio4(
	id serial primary key,
	meta varchar (255),
	trabalhando_em varchar (255),
	status boolean,
	prioridade varchar (255),
	concluido boolean 
);


Create table fundos(
	id serial primary key,
	rementente varchar (255) not null,
	destinatario varchar (255) not null,
	valor numeric (10,2) not null,
	data date not null	
);




Create table atividade (
	estagio1_id integer,
	estagio2_id integer,
	estagio3_id integer,
	estagio4_id integer,
	primary key (estagio1_id, estagio2_id, estagio3_id, estagio4_id),
	
	foreign key (estagio1_id)
	references estagio1 (id)
	on update cascade,
	
	foreign key (estagio2_id)
	references estagio2 (id)
	on update cascade,
	
	foreign key (estagio3_id)
	references estagio3 (id)
	on update cascade,
	
	foreign key (estagio4_id)
	references estagio4 (id)
	on update cascade
);

create view development as
SELECT 
    estagio1.meta AS meta_estagio1,
    estagio1.trabalhando_em AS trabalhando_em_estagio1,
    estagio1.status AS status_estagio1,
    
    estagio2.meta AS meta_estagio2,
    estagio2.trabalhando_em AS trabalhando_em_estagio2,
    estagio2.status AS status_estagio2,
    
    estagio3.meta AS meta_estagio3,
    estagio3.trabalhando_em AS trabalhando_em_estagio3,
    estagio3.status AS status_estagio3,
    
    estagio4.meta AS meta_estagio4,
    estagio4.trabalhando_em AS trabalhando_em_estagio4,
    estagio4.status AS status_estagio4

FROM estagio2
	JOIN atividade 
		ON atividade.estagio2_id = estagio2.id
	JOIN estagio1 
		ON estagio1.id = atividade.estagio1_id
	JOIN estagio3 
		ON estagio3.id = atividade.estagio3_id
	JOIN estagio4
		ON estagio4.id = atividade.estagio4_id;


insert into atividade (estagio1_id, estagio2_id, estagio3_id, estagio4_id) values   (1, 1, 1, 1),
																					(2, 2, 2, 2),
																					(3, 3, 3, 3),
																					(4, 4, 4, 4),
																					(5, 5, 5, 5),
																					(6, 6, 6, 6),
																				    (7, 7, 3, 3),
																					(3, 8, 3, 8),
																					(3, 9, 3, 9),
																					(3, 3, 3, 10);



truncate atividade
drop table Estagio1, Estagio2, Estagio3, Estagio4



insert into estagio1 (id, meta, trabalhando_em, status, prioridade, concluido) values   (1, 'Player Model', 'Arroz - Vitogama', True, 'Média', False),
																						(2, 'Câmera', 'Arroz - Vitogama', True, 'Alta', False),
																						(3, 'Movimentação', null, False, 'Alta', False),
																						(4, 'Sistema de HP', null, False, 'Média', False),
																						(5, 'Inventário', null, False, 'Média', False),
																						(6, 'Body Physics', null, False, 'Alta', False),
																						(7, 'Interação - Bonds', null, False, 'Média', False);
insert into estagio1 (id, meta, trabalhando_em, status, prioridade, concluido) values   (8, 'classe_item', 'Arroz', true, 'alta', False);

insert into estagio2 (id, meta, trabalhando_em, status, prioridade, concluido) values   (1, 'Cenário', null, False, 'Alta', False),
																						(2, 'Mapa Base', null, False, 'Alta', False),
																						(3, 'Buildings Genéricas', null, False, 'Alta', False),
																						(4, 'Buildings Corps', null, False, 'Alta', False),
																						(5, 'Building Police', null, False, 'Média', False),
																						(6, 'Building Syndicate', null, False, 'Média', False),
																						(7, 'Building Criminal', null, False, 'Média', False),
																						(8, '4 Spawnpoints', null, False, 'Média', False);


insert into estagio3 (id, meta, trabalhando_em, status, prioridade, concluido) values   (1, 'M16 Básica', null, False, 'Alta', False),
																						(2, '9mm Básica', null, False, 'Alta', False),
																						(3, 'Documentos', null, False, 'Média', False),
																						(4, 'Bandagem', null, False, 'Média', False),
																						(5, 'Sistema de Projéteis Dinâmicos', null, False, 'Alta', False),
																						(6, 'Sistema de Tiro', null, False, 'Alta', False);
																	


insert into estagio4 (id, meta, trabalhando_em, status, prioridade, concluido) values   (1, 'Vehicle Physics', null, False, 'Crítico', False),
																						(2, 'Vehicle Movement Controls', null, False, 'Crítico', False),
																						(3, 'Vehicle Seats', null, False, 'Crítico', False),
																						(4, 'Sedan', null, False, 'Alta', False),
																						(5, 'Van', null, False, 'Alta', False),
																						(6, 'Hatchback', null, False, 'Alta', False),
																						(7, 'Helicóptero', null, False, 'Alta', False),
                                                                                        (8, 'Moto', null, False, 'Média', False),
																						(9, 'Sport', null, False, 'baixa', False),
																						(10, 'Sistema de Marcha', null, False, 'Média', False);
		
		
create table funcoes_p (
	id serial primary key,
	tipo varchar(255),
	status boolean,
	utilizado boolean
);
	
	insert into funcoes_p (id, tipo, status, utilizado) values (1, 'centro de gravidade', true, false);
	
	select * from funcoes_p
		
select * from development		
truncate atividade																	
Select * from estagios															
Select * from estagio1
Select * from estagio2
Select * from estagio3
Select * from estagio4



insert into funcionarios (id, nome, team, funcao, em_atividade) values  (1, 'Stukov', 'Dev', 'Diretor_do_projeto', True),
																  (2, 'Arroz', 'Dev', 'Programador', True),
																  (3, 'Vitogama', 'Dev', 'Programador', True),
																  (4, 'Demo', 'Dev','Matemático/Físico', True),
																  (5, 'Ely', 'Dev', 'Desginer', False),
																  (6, 'Kyllb', 'Dev',null, False),
																  (7, 'Nick', 'Dev',null, False),
																  (8, 'Tokarev', 'Dev',null, False);
insert into funcionarios (id, nome, team, funcao, em_atividade) values  (9, 'Enroladim', 'Alfa-test', 'Alfa-test', False), 
																  (10, 'Jaozin','Alfa-test', 'Alfa-test', False);																 	 
																  

select * from funcionarios


Select * from Estagio1  order by id asc;

update Estagio1
set status = 'true'
where id = 6


select * from estagios
							
select * from projeto
Select * from funcionarios where em_atividade = True 
Select * from funcionarios where funcao is not null
select * from funcionarios




