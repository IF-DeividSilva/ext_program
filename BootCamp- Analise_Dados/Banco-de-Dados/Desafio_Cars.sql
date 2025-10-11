-- criação do banco de dados para o cenário de E-commerce
create database car_workshop;
use car_workshop;

create table Cliente (
	id_cliente int primary key,
    nome varchar(100),
    telefone varchar(20),
    email varchar(100)
);

create table Veicula (
	id_veiculo int primary key,
    placa varchar(10),
    modelo varchar(50),
    ano int,
    id_cliente int,
    foreign key (id_cliente) references Cliente(id_cliente)
);

create table Serviço (
	id_servico int primary key,
    descricao varchar(100),
    valor decimal(10,2)
);

create table Ordem_serviço(
	id_servico int primary key,
	data_emissao date,
    status varchar(20),
    id_veiculo int,
    foreign key (id_veiculo) references veicula(id_veiculo)
);

create table Item_servico(
	id_ordem int,
    id_servico int,
    quantidade int,
    primary key (id_ordem, id_servico),
    foreign key (id_ordem) references Ordem_serviço(id_servico),
    foreign key (id_servico) references Serviço(id_servico)
);

create table Funcionario (
	id_funcionario int primary key,
    nome varchar(100),
	funcao varchar(50)
);

create table Execucao_servico(
	id_ordem int,
    id_funcionario int,
    data_execucao date,
    primary key (id_ordem, id_funcionario),
    foreign key (id_ordem) references Ordem_serviço(id_servico),
    foreign key (id_funcionario) references Funcionario(id_funcionario)
);

INSERT INTO Cliente VALUES (1, 'João Silva', '99999-9999', 'joao@email.com');
INSERT INTO Veiculo VALUES (1, 'ABC1234', 'Civic', 2018, 1);
INSERT INTO Serviço VALUES (1, 'Troca de óleo', 120.00);
INSERT INTO Ordem_serviço VALUES (1, '2025-10-01', 'Concluído', 1);
INSERT INTO Item_servico VALUES (1, 1, 1);
INSERT INTO Funcionario VALUES (1, 'Carlos Souza', 'Mecânico');
INSERT INTO Execucao_Servico VALUES (1, 1, '2025-10-02');

SELECT nome, telefone FROM Cliente;
SELECT * FROM Veicula WHERE ano > 2015;

SELECT id_servico, SUM(s.valor * i.quantidade) AS total_servico
	FROM Item_Serviço i
	JOIN Serviço s ON i.id_servico = s.id_servico
	GROUP BY id_servico;

SELECT * FROM Ordem_Serviço ORDER BY data_emissao DESC;

SELECT id_servico, COUNT(*) AS qtd_servicos
FROM Item_Serviço
GROUP BY id_servico
HAVING COUNT(*) > 1;

SELECT c.nome, v.modelo, os.status
FROM Cliente c
JOIN Veicula v ON c.id_cliente = v.id_cliente
JOIN Ordem_Serviço os ON v.id_veiculo = os.id_veiculo;

