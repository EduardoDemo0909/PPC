
CREATE TABLE produtos(
    id SERIAL PRIMARY KEY,
	produto VARCHAR(255),
	preco NUMERIC(255),
	disponivel 	BOOLEAN
	
);

INSERT INTO produtos (id, produto, preco, disponivel) VALUES (10, 'Switch Oled', 3500.00, False);
INSERT INTO produtos (id, produto, preco, disponivel) VALUES (20, 'Switch', 2500.00, True);
INSERT INTO produtos (id, produto, preco, disponivel) VALUES (30, 'Series S', 2300.00, True);
INSERT INTO produtos (id, produto, preco, disponivel) VALUES (40, 'Series X', 4300.00, True);
INSERT INTO produtos (id, produto, preco, disponivel) VALUES (50, 'Playstation 5', 5000.00, True);
INSERT INTO produtos (id, produto, preco, disponivel) VALUES (60, 'Playstation 5 Digital', 5000.00, True);


CREATE TABLE producao(
	id SERIAL PRIMARY KEY,
	local VARCHAR(255),
	quantidade NUMERIC(255),
	nome VARCHAR(255)

);



INSERT INTO producao(id, local, quantidade, nome) VALUES (10, 'SP', 500.00, 'Switch Oled');
INSERT INTO producao(id, local, quantidade, nome) VALUES (20, 'SP', 200.00, 'switch');
INSERT INTO producao(id, local, quantidade, nome) VALUES (30, 'AM', 250.00, 'Series S');
INSERT INTO producao(id, local, quantidade, nome) VALUES (40, 'AM', 200.00, 'Series X');
INSERT INTO producao(id, local, quantidade, nome) VALUES (50, 'SP', 340.00, 'Playstation 5');
INSERT INTO producao(id, local, quantidade, nome) VALUES (60, 'SP', 340.00, 'Playstation 5 Digital');


	DELETE FROM producao WHERE id = 40;


SELECT 
	id,
	local as "local de produção",
	quantidade as "quantidade fabricados",
	nome as "modelo"

		FROM producao ORDER by id ASC;



SELECT 
	id,
	produto,
	preco as "preço",
	disponivel
		FROM produtos ORDER BY id ASC;

DELETE FROM produtos where id = 1;

DROP TABLE produtos;




select  p.nome, p.local, c.







CREATE TABLE produtos_producao(
	produtos_id INTEGER,
	producao_id INTEGER,
	PRIMARY KEY (produtos_id, producao_id),
	
	FOREIGN KEY (produtos_id)
	REFERENCES produtos (id)
	ON UPDATE CASCADE,
	
	FOREIGN KEY (producao_id)
	REFERENCES producao (id)
	ON UPDATE CASCADE
	
	
);


SELECT  producao.local as "fabricado em",
		producao.quantidade as "quantidade produzida",
		produtos.produto ,
		produtos.preco as "preço"
		
	FROM producao
	JOIN produtos_producao ON  produtos_producao.producao_id = producao.id
	JOIN produtos			ON  produtos.id		=produtos_producao.produtos_id
	ORDER BY producao ASC;
	   

INSERT INTO produtos_producao (produtos_id, producao_id) VALUES (10, 10);
INSERT INTO produtos_producao (produtos_id, producao_id) VALUES (20, 20);
INSERT INTO produtos_producao (produtos_id, producao_id) VALUES (30, 30);
INSERT INTO produtos_producao (produtos_id, producao_id) VALUES (40, 40);
INSERT INTO produtos_producao (produtos_id, producao_id) VALUES (50, 50);
INSERT INTO produtos_producao (produtos_id, producao_id) VALUES (60, 60);











