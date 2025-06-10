CREATE TABLE produto(
	id serial primary key,
	nome VARCHAR (255),
	preco NUMERIC (10,2),
	codigo NUMERIC (10)
);

insert into produto (id, nome, preco, codigo) values (01, 'bombom', 2.00, 145);
insert into produto (id, nome, preco, codigo) values (02, 'chiclete', 0.75, 146);
insert into produto (id, nome, preco, codigo) values (03, 'chocolate_b', 6.00, 147);
insert into produto (id, nome, preco, codigo) values (04, 'chocolate_p', 6.00, 148);
insert into produto (id, nome, preco, codigo) values (05, 'bala_az', 0.80, 149);
insert into produto (id, nome, preco, codigo) values (06, 'bala_do', 0.70, 150);

select * from produto

CREATE TABLE producao (
	id serial primary key,
	local VARCHAR (255),
	quantidade NUMERIC(10,2)
);

insert into producao (id, local, quantidade) values (01, 'fabrica_A', 900);
insert into producao (id, local, quantidade) values (02, 'fabrica_B', 780);
insert into producao (id, local, quantidade) values (03, 'fabrica_A', 800);
insert into producao (id, local, quantidade) values (04, 'fabrica_A', 1000);
insert into producao (id, local, quantidade) values (05, 'fabrica_B', 570);
insert into producao (id, local, quantidade) values (06, 'fabrica_B', 570);

select * from producao

CREATE TABLE venda(
	id serial primary key,
	nome VARCHAR (255)
);

insert into venda (id, nome) values (01, 'loja_A');
insert into venda (id, nome) values (02, 'loja_B');
insert into venda (id, nome) values (03, 'loja_B');
insert into venda (id, nome) values (04, 'loja_C');
insert into venda (id, nome) values (05, 'loja_B');
insert into venda (id, nome) values (06, 'loja_A');

select * from venda


CREATE TABLE produto_producao(
	produto_id INTEGER,
	producao_id INTEGER,
	venda_id INTEGER,
	primary key (produto_id, producao_id, venda_id),

	foreign key (produto_id)
	references produto (id)
	on update cascade,
	
	foreign key (producao_id)
	references producao (id)
	on update cascade,
	
	foreign key (venda_id)
	references venda(id)
	on update cascade


);





SELECT  produto.nome as nome_do_produto ,
		produto.preco as preço,
		producao.local as fabricado_em,
		producao.quantidade as quantidade_procuzida,
		venda.nome as local_de_venda

		from producao
			join produto_producao
				on produto_producao.producao_id = producao.id
			join produto
				on produto.id =  produto_producao.produto_id
			join venda
				on venda.id = produto_producao.venda_id;
				




insert into produto_producao (produto_id, producao_id, venda_id) values (01, 01, 01);
insert into produto_producao (produto_id, producao_id, venda_id) values (02, 02, 02);
insert into produto_producao (produto_id, producao_id, venda_id) values (03, 03, 03);
insert into produto_producao (produto_id, producao_id, venda_id) values (04, 04, 04);
insert into produto_producao (produto_id, producao_id, venda_id) values (05, 05, 05);
insert into produto_producao (produto_id, producao_id, venda_id) values (06, 06, 06);



	
	
	
	
	
	
CREATE TABLE ola (
	nome varchar(255) not null
);
insert into ola (nome) values ('ola mundo');
select * from ola

