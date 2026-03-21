CREATE DATABASE velozcar;
USE velozcar;

CREATE TABLE cliente (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(14) NOT NULL UNIQUE,
    data_nascimento DATE,
    telefone VARCHAR(20),
    email VARCHAR(100) UNIQUE,
    endereco VARCHAR(150),
    data_cadastro DATE NOT NULL
);

CREATE TABLE funcionario (
    id_funcionario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(14) NOT NULL UNIQUE,
    cargo VARCHAR(50) NOT NULL,
    salario DECIMAL(10,2),
    telefone VARCHAR(20),
    email VARCHAR(100),
    data_admissao DATE NOT NULL
);

CREATE TABLE veiculo (
    id_veiculo INT AUTO_INCREMENT PRIMARY KEY,
    placa VARCHAR(10) NOT NULL UNIQUE,
    modelo VARCHAR(50) NOT NULL,
    marca VARCHAR(50) NOT NULL,
    cor VARCHAR(30),
    ano INT NOT NULL,
    valor_diaria DECIMAL(10,2) NOT NULL,
    status_veiculo VARCHAR(20) NOT NULL
);

CREATE TABLE aluguel (
    id_aluguel INT AUTO_INCREMENT PRIMARY KEY,
    data_inicio DATE NOT NULL,
    data_fim DATE,
    valor_total DECIMAL(10,2),
    status_aluguel VARCHAR(20) NOT NULL,
    forma_garantia VARCHAR(50),
    km_inicial INT NOT NULL,
    km_final INT,

    id_cliente INT NOT NULL,
    id_funcionario INT NOT NULL,
    id_veiculo INT NOT NULL,

    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente),
    FOREIGN KEY (id_funcionario) REFERENCES funcionario(id_funcionario),
    FOREIGN KEY (id_veiculo) REFERENCES veiculo(id_veiculo)
);

CREATE TABLE pagamento (
    id_pagamento INT AUTO_INCREMENT PRIMARY KEY,
    valor DECIMAL(10,2) NOT NULL,
    data_pagamento DATE,
    metodo VARCHAR(20) NOT NULL,
    status_pagamento VARCHAR(20) NOT NULL,
    numero_transacao VARCHAR(50),
    data_vencimento DATE,
    tipo_pagamento VARCHAR(30),

    id_aluguel INT NOT NULL UNIQUE,
    FOREIGN KEY (id_aluguel) REFERENCES aluguel(id_aluguel)
);

CREATE TABLE manutencao (
    id_manutencao INT AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(200) NOT NULL,
    custo DECIMAL(10,2),
    data_manutencao DATE NOT NULL,
    responsavel VARCHAR(100),
    status_manutencao VARCHAR(20),
    tipo_manutencao VARCHAR(30),
    tempo_parado_dias INT,

    id_veiculo INT NOT NULL,
    FOREIGN KEY (id_veiculo) REFERENCES veiculo(id_veiculo)
);

CREATE TABLE contrato (
    id_contrato INT AUTO_INCREMENT PRIMARY KEY,
    numero_contrato VARCHAR(50) NOT NULL UNIQUE,
    data_emissao DATE NOT NULL,
    data_assinatura DATE,
    termos TEXT,
    observacoes TEXT,
    valor_caucao DECIMAL(10,2),
    status_contrato VARCHAR(20),

    id_aluguel INT NOT NULL UNIQUE,
    FOREIGN KEY (id_aluguel) REFERENCES aluguel(id_aluguel)
);

INSERT INTO cliente (nome, cpf, data_nascimento, telefone, email, endereco, data_cadastro) VALUES
('João Silva','111.111.111-11','1990-05-10','99999-1111','joao@email.com','Rua A','2024-01-01'),
('Maria Souza','222.222.222-22','1985-03-20','99999-2222','maria@email.com','Rua B','2024-01-02'),
('Carlos Lima','333.333.333-33','1992-07-15','99999-3333','carlos@email.com','Rua C','2024-01-03'),
('Ana Paula','444.444.444-44','1998-09-25','99999-4444','ana@email.com','Rua D','2024-01-04'),
('Lucas Alves','555.555.555-55','1995-11-30','99999-5555','lucas@email.com','Rua E','2024-01-05'),
('Fernanda Rocha','666.666.666-66','1988-02-18','99999-6666','fernanda@email.com','Rua F','2024-01-06'),
('Bruno Costa','777.777.777-77','1991-06-12','99999-7777','bruno@email.com','Rua G','2024-01-07'),
('Juliana Mendes','888.888.888-88','1993-08-08','99999-8888','juliana@email.com','Rua H','2024-01-08'),
('Rafael Santos','999.999.999-99','1987-12-01','99999-9999','rafael@email.com','Rua I','2024-01-09'),
('Patricia Gomes','101.101.101-10','1996-04-14','99999-0000','patricia@email.com','Rua J','2024-01-10');

INSERT INTO funcionario (nome, cpf, cargo, salario, telefone, email, data_admissao) VALUES
('Pedro Lima','123.123.123-11','Atendente',2500,'98888-1111','pedro@email.com','2023-01-01'),
('Marcos Silva','123.123.123-22','Gerente',5000,'98888-2222','marcos@email.com','2022-05-10'),
('Carla Souza','123.123.123-33','Atendente',2500,'98888-3333','carla@email.com','2023-03-15'),
('Daniel Rocha','123.123.123-44','Supervisor',3500,'98888-4444','daniel@email.com','2021-07-20'),
('Renata Alves','123.123.123-55','Atendente',2500,'98888-5555','renata@email.com','2023-09-01'),
('Tiago Mendes','123.123.123-66','Atendente',2500,'98888-6666','tiago@email.com','2022-11-11'),
('Amanda Costa','123.123.123-77','Gerente',5200,'98888-7777','amanda@email.com','2020-02-02'),
('Felipe Santos','123.123.123-88','Supervisor',3600,'98888-8888','felipe@email.com','2021-06-06'),
('Camila Gomes','123.123.123-99','Atendente',2500,'98888-9999','camila@email.com','2023-08-08'),
('Eduardo Lima','123.123.123-00','Atendente',2500,'98888-0000','edu@email.com','2023-10-10');

INSERT INTO veiculo (placa, modelo, marca, cor, ano, valor_diaria, status_veiculo) VALUES
('AAA1111','Onix','Chevrolet','Preto',2022,120,'disponivel'),
('BBB2222','HB20','Hyundai','Branco',2023,130,'alugado'),
('CCC3333','Gol','Volkswagen','Prata',2021,100,'disponivel'),
('DDD4444','Argo','Fiat','Vermelho',2022,110,'manutencao'),
('EEE5555','Corolla','Toyota','Preto',2023,200,'disponivel'),
('FFF6666','Civic','Honda','Cinza',2022,210,'alugado'),
('GGG7777','Tracker','Chevrolet','Azul',2023,180,'disponivel'),
('HHH8888','Renegade','Jeep','Branco',2022,170,'manutencao'),
('III9999','Sandero','Renault','Prata',2021,90,'disponivel'),
('JJJ0000','Kwid','Renault','Vermelho',2023,80,'disponivel');

INSERT INTO aluguel (data_inicio, data_fim, valor_total, status_aluguel, forma_garantia, km_inicial, km_final, id_cliente, id_funcionario, id_veiculo) VALUES
('2024-02-01','2024-02-05',500,'finalizado','cartao',10000,10500,1,1,1),
('2024-02-02',NULL,300,'ativo','pix',20000,NULL,2,2,2),
('2024-02-03','2024-02-06',400,'finalizado','cartao',15000,15500,3,3,3),
('2024-02-04','2024-02-07',450,'finalizado','pix',18000,18500,4,4,4),
('2024-02-05',NULL,350,'ativo','boleto',22000,NULL,5,5,5),
('2024-02-06','2024-02-08',600,'finalizado','cartao',30000,30500,6,6,6),
('2024-02-07',NULL,200,'ativo','pix',12000,NULL,7,7,7),
('2024-02-08','2024-02-10',700,'finalizado','cartao',25000,25500,8,8,8),
('2024-02-09',NULL,250,'ativo','boleto',17000,NULL,9,9,9),
('2024-02-10','2024-02-12',550,'finalizado','cartao',14000,14500,10,10,10);

INSERT INTO pagamento (valor, data_pagamento, metodo, status_pagamento, numero_transacao, data_vencimento, tipo_pagamento, id_aluguel) VALUES
(500,'2024-02-05','cartao','concluido','TX001','2024-02-05','total',1),
(300,NULL,'pix','pendente','TX002','2024-02-06','total',2),
(400,'2024-02-06','cartao','concluido','TX003','2024-02-06','total',3),
(450,'2024-02-07','pix','concluido','TX004','2024-02-07','total',4),
(350,NULL,'boleto','pendente','TX005','2024-02-10','total',5),
(600,'2024-02-08','cartao','concluido','TX006','2024-02-08','total',6),
(200,NULL,'pix','pendente','TX007','2024-02-12','total',7),
(700,'2024-02-10','cartao','concluido','TX008','2024-02-10','total',8),
(250,NULL,'boleto','pendente','TX009','2024-02-15','total',9),
(550,'2024-02-12','cartao','concluido','TX010','2024-02-12','total',10);

INSERT INTO manutencao (descricao, custo, data_manutencao, responsavel, status_manutencao, tipo_manutencao, tempo_parado_dias, id_veiculo) VALUES
('Troca de óleo',200,'2024-01-10','Carlos','concluido','preventiva',1,1),
('Revisão geral',500,'2024-01-15','João','concluido','preventiva',2,2),
('Troca de pneus',800,'2024-01-20','Pedro','concluido','corretiva',3,3),
('Freios',300,'2024-01-25','Lucas','concluido','corretiva',1,4),
('Motor',1500,'2024-01-30','Marcos','em andamento','corretiva',5,5),
('Alinhamento',150,'2024-02-01','Ana','concluido','preventiva',1,6),
('Suspensão',600,'2024-02-02','Bruno','concluido','corretiva',2,7),
('Troca bateria',400,'2024-02-03','Rafael','concluido','corretiva',1,8),
('Ar condicionado',350,'2024-02-04','Tiago','concluido','corretiva',1,9),
('Revisão elétrica',700,'2024-02-05','Felipe','em andamento','corretiva',4,10);

INSERT INTO contrato (numero_contrato, data_emissao, data_assinatura, termos, observacoes, valor_caucao, status_contrato, id_aluguel) VALUES
('C001','2024-02-01','2024-02-01','Termos padrão','-',500,'ativo',1),
('C002','2024-02-02','2024-02-02','Termos padrão','-',300,'ativo',2),
('C003','2024-02-03','2024-02-03','Termos padrão','-',400,'ativo',3),
('C004','2024-02-04','2024-02-04','Termos padrão','-',450,'ativo',4),
('C005','2024-02-05','2024-02-05','Termos padrão','-',350,'ativo',5),
('C006','2024-02-06','2024-02-06','Termos padrão','-',600,'ativo',6),
('C007','2024-02-07','2024-02-07','Termos padrão','-',200,'ativo',7),
('C008','2024-02-08','2024-02-08','Termos padrão','-',700,'ativo',8),
('C009','2024-02-09','2024-02-09','Termos padrão','-',250,'ativo',9),
('C010','2024-02-10','2024-02-10','Termos padrão','-',550,'ativo',10);

UPDATE veiculo
SET status_veiculo = 'manutencao'
WHERE id_veiculo = 1;

UPDATE aluguel
SET status_aluguel = 'finalizado', km_final = 50000
WHERE id_aluguel = 1;

SELECT COUNT(*) AS total_clientes FROM cliente;

SELECT YEAR(data_cadastro), COUNT(*) 
FROM cliente
GROUP BY YEAR(data_cadastro);

SELECT status, COUNT(*) 
FROM veiculo
GROUP BY status;

SELECT AVG(valor_diaria) 
FROM veiculo;

SELECT c.nome, v.modelo, a.data_inicio
FROM aluguel a
INNER JOIN cliente c ON a.id_cliente = c.id_cliente
INNER JOIN veiculo v ON a.id_veiculo = v.id_veiculo;

SELECT c.nome, a.id_aluguel
FROM cliente c
LEFT JOIN aluguel a ON c.id_cliente = a.id_cliente;

SELECT a.id_aluguel, p.valor
FROM aluguel a
INNER JOIN pagamento p ON a.id_aluguel = p.id_aluguel;