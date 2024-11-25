CREATE DATABASE loja_roupas;

CREATE TABLE Cliente (
    id_cliente SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    endereco VARCHAR(255) NOT NULL,
    telefone VARCHAR(20),
    email VARCHAR(100)
);

CREATE TABLE Produto (
    id_produto SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT NOT NULL,
    preco DECIMAL(10, 2) NOT NULL,
    tamanho CHAR(1),
    cor VARCHAR(50),
    estoque INT NOT NULL
);

CREATE TABLE Funcionario (
    id_funcionario SERIAL PRIMARY KEY,
    nome_funcionario VARCHAR(100) NOT NULL,
    cargo VARCHAR(50),
    telefone VARCHAR(20),
    email VARCHAR(100),
    data_admissao DATE NOT NULL
);

CREATE TABLE Venda (
    id_venda SERIAL PRIMARY KEY,
    data_venda DATE NOT NULL,
    valor_total DECIMAL(10, 2) NOT NULL,
    forma_pagamento VARCHAR(50),
    id_cliente INT,
    id_funcionario INT,
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente),
    FOREIGN KEY (id_funcionario) REFERENCES Funcionario(id_funcionario)
);

CREATE TABLE Fornecedor (
    id_fornecedor SERIAL PRIMARY KEY,
    nome_fornecedor VARCHAR(100) NOT NULL,
    contato VARCHAR(20),
    endereco VARCHAR(255)
);

CREATE TABLE Cliente_Venda (
    id_cliente INT NOT NULL,
    id_venda INT NOT NULL,
    PRIMARY KEY (id_cliente, id_venda),
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente),
    FOREIGN KEY (id_venda) REFERENCES Venda(id_venda)
);

CREATE TABLE Produto_Venda (
    id_produto INT NOT NULL,
    id_venda INT NOT NULL,
    quantidade INT NOT NULL,
    PRIMARY KEY (id_produto, id_venda),
    FOREIGN KEY (id_produto) REFERENCES Produto(id_produto),
    FOREIGN KEY (id_venda) REFERENCES Venda(id_venda)
);

CREATE TABLE Fornecedor_Produto (
    id_fornecedor INT NOT NULL,
    id_produto INT NOT NULL,
    PRIMARY KEY (id_fornecedor, id_produto),
    FOREIGN KEY (id_fornecedor) REFERENCES Fornecedor(id_fornecedor),
    FOREIGN KEY (id_produto) REFERENCES Produto(id_produto)
);

CREATE TABLE Funcionario_Venda (
    id_funcionario INT NOT NULL,
    id_venda INT NOT NULL,
    PRIMARY KEY (id_funcionario, id_venda),
    FOREIGN KEY (id_funcionario) REFERENCES Funcionario(id_funcionario),
    FOREIGN KEY (id_venda) REFERENCES Venda(id_venda)
);

INSERT INTO Cliente (nome, endereco, telefone, email) VALUES
('Julia Gabrielle', 'Rua das Flores, 123', '(11) 9999-8888', 'julia.gabrielle@gmail.com'),
('Maria Helena', 'Avenida da Luz, 456', '(21) 9888-7777', 'maria.helena@gmail.com');

INSERT INTO Produto (nome, descricao, preco, tamanho, cor, estoque) VALUES
('Vestido de Verão', 'Vestido leve e estampado', 150.00, 'P', 'Floral', 80),
('Blusa de Alcinha', 'Blusa de alcinha em seda', 90.00, 'M', 'Preto', 50),
('Saia Midi', 'Saia midi com faixa na cintura', 120.00, 'G', 'Azul', 60),
('Calça Jeans', 'Calça jeans skinny', 140.00, 'M', 'Azul', 100);

INSERT INTO Fornecedor (nome_fornecedor, contato, endereco) VALUES
('Moda Elegante', '(11) 9123-4567', 'Rua das Roupas, 789'),
('Estilo Feminino', '(21) 9987-6543', 'Avenida das Tendências, 321');

INSERT INTO Funcionario (nome_funcionario, cargo, telefone, email, data_admissao) VALUES
('Ana Souza', 'Vendedora', '(11) 9888-5555', 'ana.souza@gmail.com', '2023-01-10'),
('Carlos Pereira', 'Gerente', '(21) 9777-4444', 'carlos.pereira@gmail.com', '2022-05-15'),
('Rita Almeida', 'Estoquista', '(11) 9666-3333', 'rita.almeida@gmail.com', '2023-03-22');

INSERT INTO Venda (data_venda, valor_total, forma_pagamento, id_cliente, id_funcionario) VALUES
('2023-09-15', 300.00, 'Cartão de Crédito', 1, 1),
('2023-09-16', 200.00, 'Dinheiro', 2, 2);

INSERT INTO Cliente_Venda (id_cliente, id_venda) VALUES
(1, 1), (2, 2);

INSERT INTO Produto_Venda (id_produto, id_venda, quantidade) VALUES
(1, 1, 2), (2, 2, 1);

INSERT INTO Fornecedor_Produto (id_fornecedor, id_produto) VALUES
(1, 1), (2, 2);

INSERT INTO Funcionario_Venda (id_funcionario, id_venda) VALUES
(1, 1), (2, 2);

SELECT
    Cliente.id_cliente,
    Cliente.nome,
    Cliente.endereco,
    Cliente.telefone,
    Cliente.email,
    Venda.id_venda,
    Venda.data_venda,
    Venda.valor_total,
    Venda.forma_pagamento
FROM
    Cliente
JOIN Venda ON Cliente.id_cliente = Venda.id_cliente;

SELECT
    Produto.id_produto,
    Produto.nome AS nome_produto,
    Produto.descricao,
    Produto.preco,
    Produto.tamanho,
    Produto.cor,
    Produto.estoque,
    Produto_Venda.quantidade,
    Venda.id_venda,
    Venda.data_venda,
    Venda.valor_total
FROM
    Produto
JOIN Produto_Venda ON Produto.id_produto = Produto_Venda.id_produto
JOIN Venda ON Produto_Venda.id_venda = Venda.id_venda;

SELECT
    Fornecedor.id_fornecedor,
    Fornecedor.nome_fornecedor,
    Fornecedor.contato,
    Fornecedor.endereco,
    Produto.id_produto,
    Produto.nome AS nome_produto,
    Produto.descricao,
    Produto.preco,
    Produto.tamanho,
    Produto.cor,
    Produto.estoque
FROM
    Fornecedor
JOIN Fornecedor_Produto ON Fornecedor.id_fornecedor = Fornecedor_Produto.id_fornecedor
JOIN Produto ON Fornecedor_Produto.id_produto = Produto.id_produto;

SELECT
    Funcionario.id_funcionario,
    Funcionario.nome_funcionario,
    Funcionario.cargo,
    Funcionario.telefone,
    Funcionario.email,
    Funcionario.data_admissao,
    Venda.id_venda,
    Venda.data_venda,
    Venda.valor_total,
    Venda.forma_pagamento
FROM
    Funcionario
JOIN Funcionario_Venda ON Funcionario.id_funcionario = Funcionario_Venda.id_funcionario
JOIN Venda ON Funcionario_Venda.id_venda = Venda.id_venda;

SELECT
    Cliente.id_cliente,
    Cliente.nome AS nome_cliente,
    Cliente.endereco,
    Cliente.telefone,
    Cliente.email,
    Produto.id_produto,
    Produto.nome AS nome_produto,
    Produto.descricao,
    Produto.preco,
    Produto.tamanho,
    Produto.cor,
    Produto.estoque,
    Produto_Venda.quantidade,
    Venda.id_venda,
    Venda.data_venda,
    Venda.valor_total,
    Venda.forma_pagamento
FROM
    Cliente
JOIN Venda ON Cliente.id_cliente = Venda.id_cliente
JOIN Produto_Venda ON Venda.id_venda = Produto_Venda.id_venda
JOIN Produto ON Produto_Venda.id_produto = Produto.id_produto;

SELECT
    Fornecedor.id_fornecedor,
    Fornecedor.nome_fornecedor,
    Fornecedor.contato,
    Fornecedor.endereco,
    Produto.id_produto,
    Produto.nome AS nome_produto,
    Produto.descricao,
    Produto.preco,
    Produto.tamanho,
    Produto.cor,
    Produto.estoque,
    Produto_Venda.quantidade,
    Venda.id_venda,
    Venda.data_venda,
    Venda.valor_total,
    Venda.forma_pagamento
FROM
    Fornecedor
JOIN Fornecedor_Produto ON Fornecedor.id_fornecedor = Fornecedor_Produto.id_fornecedor
JOIN Produto ON Fornecedor_Produto.id_produto = Produto.id_produto
JOIN Produto_Venda ON Produto.id_produto = Produto_Venda.id_produto
JOIN Venda ON Produto_Venda.id_venda = Venda.id_venda;

select * from produto p 

select * from funcionario f 

