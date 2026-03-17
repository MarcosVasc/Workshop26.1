CREATE SCHEMA DESAFIO;
USE DESAFIO;

CREATE TABLE professor (
	id INT NOT NULL PRIMARY KEY,
	nome VARCHAR (50) NOT NULL,
    sexo CHAR (1) NOT NULL,
    salario INT NOT NULL
);

CREATE TABLE turma (
	id INT NOT NULL PRIMARY KEY,
    periodo INT NOT NULL,
    idProfessor INT NOT NULL,
    turno VARCHAR (10),
    FOREIGN KEY  (idProfessor) REFERENCES professor(id)
);

INSERT INTO 
professor (id, nome, sexo, salario)
VALUES 
(1, 'Ana Souza', 'F', 4500),
(2, 'Carlos Pereira', 'M', 5200),
(3, 'Mariana Lima', 'F', 4800),
(4, 'João Santos', 'M', 5500),
(5, 'Fernanda Alves', 'F', 4700),
(6, 'Ricardo Gomes', 'M', 6000),
(7, 'Patrícia Rocha', 'F', 5300),
(8, 'Lucas Martins', 'M', 4900),
(9, 'Juliana Costa', 'F', 5100),
(10, 'Eduardo Oliveira', 'M', 5800);

INSERT INTO
turma (id, periodo, idProfessor, turno)
VALUES
(1, 6 , 1, 'Manhã'),
(2, 5 , 2, 'Tarde'),
(3, 8 , 3, 'Noite'),
(4, 8 , 4, 'Manhã'),
(5, 8 , 5, 'Tarde'),
(6, 2 , 6, 'Noite'),
(7, 8 , 7, 'Manhã'),
(8, 1 , 8, 'Tarde'),
(9, 2 , 9, 'Noite'),
(10, 6 , 10, 'Manhã');

UPDATE turma 
SET turno = 'Noite'
WHERE periodo = 8;

SELECT turno
FROM turma
WHERE periodo = 8;

SELECT COUNT(*) FROM professor;
SELECT SUM(salario) FROM professor;
SELECT AVG(salario) FROM professor;

SELECT sexo, AVG(salario) AS media_salarial
FROM professor
GROUP BY sexo;

SELECT sexo, AVG(salario) AS media
from professor
GROUP BY sexo
HAVING media > 5000;

SELECT p.nome, t.periodo, t.turno
FROM professor p
JOIN turma t ON p.id = t.idProfessor;