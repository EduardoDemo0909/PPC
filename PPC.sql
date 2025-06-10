create table setores(
	id serial primary key,
	nome text
);


create table colaboradores (
	id serial primary key,
	nome text,
	setor integer references setores(id)
);


insert into setores (id, nome) values 
(10, 'Back-end'),
(20, 'Front-end'),
(30, 'DB');


insert into colaboradores (nome, setor)
select 'Eduardo', id from setores where nome = 'DB';


select 
		c.id,
		c.nome,
		s.nome as setor
from colaboradores c
join setores s on c.setor = s.id

















