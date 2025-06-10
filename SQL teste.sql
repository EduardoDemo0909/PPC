CREATE DATABASE bancodedados



CREATE TABLE carros(
    id SERIAL PRIMARY KEY,
    modelo VARCHAR(255),
    ano CHAR(11),
    preço NUMERIC(10,2),
    compra BOOLEAN,
    vendas CHAR(100),
	total NUMERIC(12, 2)
);



INSERT INTO carros(id, modelo, ano, preço, compra, vendas) VALUES (1, 'Cronos', 2021, 90000.00, true, 25);
INSERT INTO carros(id, modelo, ano, preço, compra, vendas) VALUES (2, 'Civic', 2019, 110000.00, true, 35);
INSERT INTO carros(id, modelo, ano, preço, compra, vendas) VALUES (3, 'Tracker', 2023, 130000.00, false, 50);
INSERT INTO carros(id, modelo, ano, preço, compra, vendas) VALUES (4, 'Ka sedan', 2020, 60000.00, true, 47);
INSERT INTO carros(id, modelo, ano, preço, compra, vendas) VALUES (5, 'Fit', 2019, 70000.00, true, 21);
INSERT INTO carros(id, modelo, ano, preço, compra, vendas) VALUES (6, 'Corola', 2023, 150000.00, true, 65);
INSERT INTO carros(id, modelo, ano, preço, compra, vendas) VALUES (7, 'Onix', 2023, 93000.00, true, 75);

	DELETE FROM carros WHERE modelo = 'Cronos, Civic, Tracker, Ka sedan, Fit'

delete from carros
	where modelo = 'Tracker';


SELECT 
	id,
	modelo,
	ano,
	preço,
	compra as "disponivel",
	vendas as "quantidades vendias"
		FROM carros;

SELECT 
	modelo,
	ano,
	preço,
	compra as "disponivel",
	vendas as "quantidades vendias"
		FROM carros
	    ORDER BY modelo ASC;
	
SELECT * FROM carros
	ORDER BY modelo ASC;
	
	

	
	
	
	
	
CREATE TABLE funcionarios(
	id SERIAL PRIMARY KEY,
	funcionario VARCHAR(255) NOT NULL,
	identificação INTEGER NOT NULL,
	setor VARCHAR(255) NOT NULL

);	

INSERT INTO funcionarios (id, funcionario, identificação, setor) VALUES (10, 'Eduardo', 3265, 3);
INSERT INTO funcionarios (id, funcionario, identificação, setor) VALUES (11, 'Pablo', 9876, 2);
INSERT INTO funcionarios (id, funcionario, identificação, setor) VALUES (12, 'Rodrigo', 4321, 3);
INSERT INTO funcionarios (id, funcionario, identificação, setor) VALUES (13, 'Wagner', 7410, 1);
INSERT INTO funcionarios (id, funcionario, identificação, setor) VALUES (14, 'Thiago', 7913, 1);

UPDATE funcionarios
	SET setor = 3
	WHERE setor = '1'

SELECT * FROM funcionarios

SELECT 
	funcionario as "Nome",
	identificação as "código de indentificação",
	setor
	FROM funcionarios
	ORDER BY funcionario ASC;

SELECT * FROM funcionarios;

DELETE FROM funcionarios WHERE ID = '4';

DROP TABLE carros_funcionarios;
CREATE TABLE carros_funcionarios (
    carros_id INTEGER,
    funcionarios_id INTEGER,
    PRIMARY KEY (carros_id, funcionarios_id),

    FOREIGN KEY (carros_id)
    REFERENCES carros (id)
	ON UPDATE CASCADE,
	

    FOREIGN KEY (funcionarios_id)
    REFERENCES funcionarios (id)
	ON UPDATE CASCADE
);



INSERT INTO carros_funcionarios (carros_id, funcionarios_id) Values (1, 10)
INSERT INTO carros_funcionarios (carros_id, funcionarios_id) Values (2, 11)
INSERT INTO carros_funcionarios (carros_id, funcionarios_id) Values (4, 12)
INSERT INTO carros_funcionarios (carros_id, funcionarios_id) Values (5, 13)
INSERT INTO carros_funcionarios (carros_id, funcionarios_id) Values (3, 13)
INSERT INTO carros_funcionarios (carros_id, funcionarios_id) Values (6, 10)
INSERT INTO carros_funcionarios (carros_id, funcionarios_id) Values (7, 14)



SELECT  funcionarios.funcionario  as "Vendedor",
		funcionarios.setor		  as "Setor de venda",
		carros.modelo	as "modelo vendido",  
		carros.ano 		as "ano de fabricação"
		
		
	FROM funcionarios
	FULL JOIN carros_funcionarios ON carros_funcionarios.funcionarios_id = funcionarios.id
	FULL JOIN carros		 ON carros.id				  = carros_funcionarios.carros_id
	ORDER BY funcionario ASC;


SELECT 
	modelo,
	ano,
	preço,
	compra as "disponivel",
	vendas as "quantidades vendias"
		FROM carros
	    ORDER BY modelo ASC;



SELECT 
	funcionario as "Nome",
	identificação as "código de indentificação",
	setor
	FROM funcionarios
	ORDER BY funcionario ASC;


SELECT  funcionarios.funcionario  as "Vendedor",
		funcionarios.setor		  as "Setor de venda",
		carros.modelo	as "modelo vendido",  
		carros.ano 		as "ano de fabricação"
	FROM funcionarios
 CROSS JOIN carros



CREATE TABLE(
	id serial PRIMARY KEY
	vendas 
);





CREATE TABLE







///////////////////////////////////////////////////////////////////


CREATE TABLE curso(
	id INTEGER PRIMARY KEY,
	nome VARCHAR(255) NOT NULL
);

INSERT INTO curso (id, nome) VALUES (1, 'HTML');
INSERT INTO curso (id, nome) VALUES (2, 'Javascript');
INSERT INTO curso (id, nome) VALUES (3, 'SQL');

SELECT * FROM curso;


CREATE TABLE aluno (
	id SERIAL PRIMARY KEY,
	nome VARCHAR(255) NOT NULL
);

INSERT  INTO aluno (nome) VALUES ('Eduardo');
INSERT  INTO aluno (nome) VALUES ('Pablo');
INSERT  INTO aluno (nome) VALUES ('Wagner');


delete from aluno_curso where aluno_id = 'Eduardo'


SELECT * FROM aluno;



CREATE TABLE aluno_curso (
	aluno_id INTEGER,
	curso_id INTEGER,
	PRIMARY KEY (aluno_id,curso_id),
	
	FOREIGN KEY (aluno_id)
   REFERENCES aluno (id),
	
	FOREIGN KEY (curso_id)
   REFERENCES curso (id)
);


INSERT  INTO aluno_curso (aluno_id,curso_id) VALUES (1,1);
INSERT  INTO aluno_curso (aluno_id,curso_id) VALUES (2,1);



INSERT  INTO aluno_curso (aluno_id,curso_id) VALUES (3,1);
INSERT  INTO aluno_curso (aluno_id,curso_id) VALUES (1,3);


SELECT * 
  FROM aluno
  JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id;
  
SELECT * 
  FROM aluno
  JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
  JOIN curso		   ON curso.id		   = aluno_curso.curso_id;
  
INSERT INTO aluno_curso (aluno_id, curso_id) VALUES (2,2);

SELECT aluno.nome,
	   curso.nome
  FROM aluno
  JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
  JOIN curso		   ON curso.id		   = aluno_curso.curso_id;
  
SELECT aluno.nome as aluno,
	   curso.nome as curso
  FROM aluno
  JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
  JOIN curso		   ON curso.id		   = aluno_curso.curso_id;
  
SELECT aluno.nome as aluno_nome,
	   curso.nome as curso_nome
  FROM aluno
  JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
  JOIN curso		   ON curso.id		   = aluno_curso.curso_id;

SELECT aluno.nome as "Nome do aluno",
	   curso.nome as "Nome do curso"
  FROM aluno
  JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
  JOIN curso		   ON curso.id		   = aluno_curso.curso_id;
  
  
///////////////////////////////////////////////////////////////////





CREATE TABLE 











