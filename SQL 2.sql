CREATE DATABASE bancodedados

CREATE TABLE carros(
    id SERIAL,
    modelo VARCHAR(255),
    ano CHAR(11),
    preço NUMERIC(10,2),
    compra BOOLEAN,
    vendas CHAR(100)
);


INSERT INTO carros(modelo, ano, preço, compra, vendas) VALUES ('cronos', 2021, 90000.00, true, 25);
INSERT INTO carros(modelo, ano, preço, compra, vendas) VALUES ('Civic', 2019, 110000.00, true, 35);
INSERT INTO carros(modelo, ano, preço, compra, vendas) VALUES ('Tracker', 2023, 130000.00, false, 50);
INSERT INTO carros(modelo, ano, preço, compra, vendas) VALUES ('Ka sedan', 2020, 60000.00, true, 47);
INSERT INTO carros(modelo, ano, preço, compra, vendas) VALUES ('Fit', 2019, 70000.00, true, 21);



SELECT 
	modelo,
	ano,
	preço,
	compra as "disponivel",
	vendas as "quantidades vendias"
		FROM carros
	WHERE ano = '2021';


