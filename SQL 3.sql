CREATE TABLE teste(
    id SERIAL,
	curso VARCHAR(255) NOT NULL,
	estado VARCHAR(255) NOT NULL,
	quantidade_de_vendas DECIMAL (100) NOT NULL,
	valor DECIMAL (255) NOT NULL
	

);

SELECT * FROM teste
	WHERE estado LIKE 'P%'
;

INSERT INTO teste (curso, estado, quantidade_de_vendas, valor) VALUES ('html', 'PR', 53, 5300.00) 
INSERT INTO teste (curso, estado, quantidade_de_vendas, valor) VALUES ('css', 'RS', 40, 4000.00)
INSERT INTO teste (curso, estado, quantidade_de_vendas, valor) VALUES ('Python', 'RJ', 90, 9000.00) 
INSERT INTO teste (curso, estado, quantidade_de_vendas, valor) VALUES ('SQL', 'PR', 55, 5500.00) 