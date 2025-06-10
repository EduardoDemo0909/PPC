CREATE TABLE imovel(
    id SERIAL PRIMARY KEY,
    modelo VARCHAR(255),
    ano CHAR(11),
    preco NUMERIC(10,2),
    compra BOOLEAN
);

drop table imovel;
INSERT INTO imovel (id, modelo, ano, preco, compra) VALUES (10, 'casa', 2010, 300000.00, true);
INSERT INTO imovel (id, modelo, ano, preco, compra) VALUES (20, 'casa', 2000, 400000.00, true);
INSERT INTO imovel (id, modelo, ano, preco, compra) VALUES (30, 'sobrado', 1985, 600000.00, true);
INSERT INTO imovel (id, modelo, ano, preco, compra) VALUES (40, 'casa/g', 2010, 300000.00, true);
INSERT INTO imovel (id, modelo, ano, preco, compra) VALUES (50, 'triplex', 2020, 1000000.00, false);
INSERT INTO imovel (id, modelo, ano, preco, compra) VALUES (60, 'apartamento/p', 2010, 450000.00, true);
INSERT INTO imovel (id, modelo, ano, preco, compra) VALUES (70, 'apartamento/m', 2023, 500000.00, true);


CREATE TABLE lugar(
	id SERIAL PRIMARY KEY,
	bairro VARCHAR(255),
	cidade VARCHAR(255),
	emcon BOOLEAN
);


INSERT INTO lugar (id, bairro, cidade, emcon) VALUES (10, 'Centro', 'Curitiba', false );
INSERT INTO lugar (id, bairro, cidade, emcon) VALUES (20, 'Portão', 'Curitiba', false );
INSERT INTO lugar (id, bairro, cidade, emcon) VALUES (30, 'Centro', 'Fazendo rio grande', false );
INSERT INTO lugar (id, bairro, cidade, emcon) VALUES (40, 'Água verde', 'Curitiba', false );
INSERT INTO lugar (id, bairro, cidade, emcon) VALUES (50, 'Bairro alto', 'Curitiba', false );
INSERT INTO lugar (id, bairro, cidade, emcon) VALUES (60, 'CIC', 'Curitiba', false );
INSERT INTO lugar (id, bairro, cidade, emcon) VALUES (70, 'Santa felicidade', 'Curitiba', true);
INSERT INTO lugar (id, bairro, cidade, emcon) VALUES (80, 'Tatuquara', 'Curitiba', false);
INSERT INTO lugar (id, bairro, cidade, emcon) VALUES (90, 'bairro', 'Londrina', false);




select * FROM lugar order by id asc;

select sum (id) from lugar;
select min (id) from lugar;
select avg (id) from lugar;

CREATE TABLE imovel_lugar(
	imovel_id INTEGER,
	lugar_id INTEGER,
	PRIMARY KEY (imovel_id, lugar_id),
	
	FOREIGN KEY (imovel_id)
	REFERENCES imovel(id)
	ON UPDATE CASCADE,
	
	FOREIGN KEY (lugar_id)
	REFERENCES lugar (id)
	ON UPDATE CASCADE
);
 


INSERT INTO  imovel_lugar (imovel_id, lugar_id) VALUES (10, 10);
INSERT INTO  imovel_lugar (imovel_id, lugar_id) VALUES (20, 20);
INSERT INTO  imovel_lugar (imovel_id, lugar_id) VALUES (30, 30);
INSERT INTO  imovel_lugar (imovel_id, lugar_id) VALUES (40, 40);
INSERT INTO  imovel_lugar (imovel_id, lugar_id) VALUES (50, 50);
INSERT INTO  imovel_lugar (imovel_id, lugar_id) VALUES (60, 60);
INSERT INTO  imovel_lugar (imovel_id, lugar_id) VALUES (70, 70);



SELECT  imovel.ID,
		imovel.modelo,
		imovel.ano as construido,
		imovel.preco as valor,
		lugar.bairro,
		lugar.cidade,
		lugar.emcon
		
		FROM lugar
		JOIN imovel_lugar ON imovel_lugar.lugar_id = lugar.id
		JOIN imovel		  ON imovel.id			   = imovel_lugar.imovel_id
		WHERE modelo LIKE '%a%';
		
SELECT imovel ,lugar
		FROM imovel
		LEFT JOIN lugar ON imovel.id = lugar.id;
		
SELECT * FROM imovel;
SELECT * FROM lugar;


DROP FUNCTION IF EXISTS armazem();

CREATE OR REPLACE FUNCTION armazem(a DECIMAL(10, 2), b DECIMAL (10, 2))
	RETURNS INT
	RETURN a*b;
	
	
	
CREATE OR REPLACE FUNCTION write(msg varchar) RETURNS varchar AS
$$
BEGIN
	RETURN msg;
END;
$$
LANGUAGE plpgsql;


SELECT write('ciao');





SELECT id, armazem (id, 10) AS resultado
FROM imovel
WHERE id = 20;
	

SELECT  impares();


SELECT modelo, armazem(preco, ) 
FROM imovel
WHERE preco = 300000.00 ;



//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


CREATE TABLE dados(
	id serial primary key,
	nome VARCHAR(255) NOT NULL,
	dinheiro NUMERIC(10,2) NOT NULL
);


INSERT INTO dados (id, nome, dinheiro) VALUES (1, 'vendedor_1', 2000.00);
INSERT INTO dados (id, nome, dinheiro) VALUES (2, 'vendedor_2', 4000.00);
INSERT INTO dados (id, nome, dinheiro) VALUES (3, 'vendedor_3', 6000.00);

CREATE TABLE setor(
	ID SERIAL PRIMARY KEY,
	setor VARCHAR(255) NOT NULL,
	produto VARCHAR(255) NOT NULL

);


INSERT INTO setor (id, setor, produto) VALUES (1, 'A1', 'Chip');
INSERT INTO setor (id, setor, produto) VALUES (2, 'A2', 'Bateria');
INSERT INTO setor (id, setor, produto) VALUES (3, 'A3', 'Tela');

CREATE TABLE chefe(
	ID SERIAL PRIMARY KEY,
	nome VARCHAR(255) NOT NULL,
	identificacao VARCHAR NOT NULL
);

INSERT INTO chefe (id, nome, identificacao) VALUES (1, 'chefe_1', 'A4A');
INSERT INTO chefe (id, nome, identificacao) VALUES (2, 'chefe_2', 'A4B');
INSERT INTO chefe (id, nome, identificacao) VALUES (3, 'chefe_3', 'A4C');


SELECT * FROM dados;
SELECT * FROM setor;
SELECT * FROM chefe;


CREATE TABLE d_s_c(
	dados_id INTEGER,
	setor_id INTEGER,
	chefe_id INTEGER,
	PRIMARY KEY(dados_id, setor_id, chefe_id),
	
	FOREIGN KEY (dados_id)
	REFERENCES dados(id)
	ON UPDATE CASCADE,

	FOREIGN KEY (setor_id)
	REFERENCES setor(id)
	ON UPDATE CASCADE,
	
	FOREIGN KEY (chefe_id)
	REFERENCES chefe (id)
	ON UPDATE CASCADE
);


INSERT INTO d_s_c (dados_id, setor_id, chefe_id) VALUES (1, 1, 1);
INSERT INTO d_s_c (dados_id, setor_id, chefe_id) VALUES (2, 2, 2);
INSERT INTO d_s_c (dados_id, setor_id, chefe_id) VALUES (3, 3, 3);

SELECT  dados.nome,
	    dados.dinheiro AS Salário,
		setor.setor,
		setor.produto,
		chefe.nome AS Chefe,
		chefe.identificacao
		
	FROM setor
		JOIN d_s_c 
			ON d_s_c.setor_id = setor.id
		JOIN dados 
			ON dados.id = d_s_c.dados_id
		JOIN chefe 
			ON chefe.id = d_s_c.chefe_id;
		
		
SELECT nome, dinheiro FROM dados;

CREATE OR REPLACE VIEW setor_inteiro AS
	SELECT  dados.nome,
	    dados.dinheiro AS Salário,
		setor.setor,
		setor.produto,
		chefe.nome AS Chefe,
		chefe.identificacao
		
	FROM setor
		INNER JOIN d_s_c 
			ON d_s_c.setor_id = setor.id
		INNER JOIN dados 
			ON dados.id = d_s_c.dados_id
		INNER JOIN chefe 
			ON chefe.id = d_s_c.chefe_id;



SELECT * FROM setor_inteiro;

SELECT chefe, setor FROM setor_inteiro;





create table 				
insert
select into
from
where
like






CREATE TABLE falso(
	ID serial primary key,
	setor VARCHAR(255),
	produto VARCHAR(255)

);

drop table falso

insert into falso  (id, setor, produto) values (10, 'N', 'n')
insert into falso  (id, setor, produto) values (20, 'N', 'n')



select * from falso;

truncate falso;




	
	




