CREATE TABLE Motorista(
    Cod_Motor  varchar(8),
    Nome_Motor varchar(50),
    CPF_Motor Varchar(15),
    Telefone_Motor varchar(20),
    CNH_Motor varchar(20),
    CONSTRAINT pk_motor PRIMARY key (Cod_Motor)
);

CREATE TABLE Rota(
    ID_Rota INT,
    Saida_Rota varchar(50),
    Destino_Rota Varchar(50),
    PRIMARY key (ID_Rota)
);

CREATE TABLE Onibus(
    Cod_Onibus  varchar(8),
    Placa_Onibus varchar(10),
    Marca_Onibus Varchar(20),
    QTD_Assento INT, 
    Garagem_Onibus varchar(20),
    CONSTRAINT pk_Onibus PRIMARY key (Cod_Onibus)
);

CREATE TABLE Viagens(
    ID_Viagem INT,
    Horario_Saida  varchar(20),
    Tempo_Viagem INT,
    Horario_Chegada varchar(20),
    ID_Rota INT,
    Cod_Onibus varchar(8), 
    CONSTRAINT pk_viagem PRIMARY KEY (ID_Viagem),
    FOREIGN KEY(ID_Rota) REFERENCES Rota(ID_Rota),
    FOREIGN KEY(Cod_Onibus) REFERENCES Onibus(Cod_Onibus)
);


CREATE table Realiza(
    COD_Motor varchar(9),
    ID_Viagem INT,

    PRIMARY KEY (COD_Motor, ID_Viagem),
    FOREIGN KEY(COD_Motor) REFERENCES Motorista(COD_Motor),
    FOREIGN key(ID_Viagem) references Viagens (ID_Viagem)
);

CREATE TABLE passagem(
    COD_Passagem INT,
    Num_Passagem INT,
    Valor_Passagem FLOAT,
    Data_compra VARCHAR(20),
    CPF_Passageiro VARCHAR(12),
    ID_Viagem int,
    FOREIGN KEY(ID_Viagem) REFERENCES Viagens(ID_Viagem)
);


INSERT INTO Motorista (Cod_Motor, Nome_Motor, CPF_Motor, Telefone_Motor, CNH_Motor) VALUES
('MOT4521', 'João Pedro', '12345678901', '(21) 9999-8888', 'SP123456789'),
('MOT8932', 'Maria Silva', '98765432109', '(31) 9888-7777', 'SP987654321'),
('MOT1247', 'Carlos Andrade', '45678912345', '(22) 9777-6666', 'MG456789123'),
('MOT7834', 'Ana Pereira', '78912345678', '(21) 9666-5555', 'RJ789123456'),
('MOT2391', 'Lucas Costa', '32165498732', '(31) 9555-4444', 'MG321654987'),
('MOT6723', 'Luiza Santos', '65498732165', '(41) 9444-3333', 'PR654987321'),
('MOT9145', 'Rafael Anjos', '14725836914', '(48) 9333-2222', 'SC147258369'),
('MOT3568', 'Marcos Lima', '25836914725', '(51) 9222-1111', 'RS258369147'),
('MOT5912', 'Antonio Martins', '36914725836', '(61) 9111-0000', 'DF369147258'),
('MOT4087', 'Arthur Alves', '95175386495', '(71) 9000-9999', 'BA951753864');

INSERT INTO Rota (ID_Rota, Saida_Rota, Destino_Rota) VALUES
(1, 'São Paulo', 'Rio de Janeiro'),
(2, 'Belo Horizonte', 'Vitória'),
(3, 'Curitiba', 'Florianópolis'),
(4, 'Porto Alegre', 'Gramado'),
(5, 'Salvador', 'Aracaju'),
(6, 'Recife', 'Maceió'),
(7, 'Goiânia', 'Brasília'),
(8, 'Campinas', 'Ribeirão Preto');

INSERT INTO Onibus (Cod_Onibus, Placa_Onibus, Marca_Onibus, QTD_Assento, Garagem_Onibus) VALUES
('BUS001', 'ABC-1234', 'Mercedes 500', 42, 'Niterói 101'),
('BUS002', 'DEF-5678', 'Volvo B340', 38, 'Central 205'),
('BUS003', 'GHI-9012', 'Marcopolo', 44, 'Gramacho 308'),
('BUS004', 'JKL-3456', 'Scania K360', 40, 'Caxias 412'),
('BUS005', 'MNO-7890', 'Volare W9', 36, 'Nova Iguaçu 515'),
('BUS006', 'PQR-1234', 'Neobus Mega', 45, 'Niterói 102'),
('BUS007', 'STU-5678', 'Caio Mondego', 39, 'Central 207'),
('BUS008', 'VWX-9012', 'Irizar i6', 41, 'Gramacho 310');

INSERT INTO Viagens (ID_Viagem, Horario_Saida, Tempo_Viagem, Horario_Chegada, ID_Rota, Cod_Onibus) VALUES
(1, '2025-11-15 08:00:00', 6, '2025-11-15 14:00:00', 1, 'BUS001'),
(2, '2025-11-16 07:30:00', 5, '2025-11-16 12:30:00', 2, 'BUS002'),
(3, '2025-11-17 09:00:00', 7, '2025-11-17 16:00:00', 3, 'BUS003'),
(4, '2025-11-18 06:00:00', 4, '2025-11-18 10:00:00', 4, 'BUS004'),
(5, '2025-11-19 13:00:00', 3, '2025-11-19 16:00:00', 5, 'BUS005'),
(6, '2025-11-20 10:00:00', 6, '2025-11-20 16:00:00', 6, 'BUS006'),
(7, '2025-11-21 14:00:00', 5, '2025-11-21 19:00:00', 7, 'BUS007'),
(8, '2025-11-22 08:30:00', 4, '2025-11-22 13:00:00', 8, 'BUS008'),
(9, '2025-11-23 11:00:00', 6, '2025-11-23 17:00:00', 1, 'BUS001'),
(10, '2025-11-24 09:00:00', 7, '2025-11-24 16:00:00', 2, 'BUS002');

INSERT INTO Realiza (COD_Motor, ID_Viagem) VALUES
('MOT4521', 1),
('MOT8932', 2),
('MOT1247', 3),
('MOT7834', 4),
('MOT2391', 5),
('MOT6723', 6),
('MOT9145', 7),
('MOT3568', 8),
('MOT5912', 9),
('MOT4087', 10),
('MOT4521', 3),
('MOT8932', 4),
('MOT1247', 5),
('MOT7834', 6),
('MOT2391', 7);

INSERT INTO passagem (COD_Passagem, Num_Passagem, Valor_Passagem, Data_compra, CPF_Passageiro, ID_Viagem) VALUES
(1, 12, 150.00, '2025-11-10', '11122233344', 1),
(2, 15, 180.00, '2025-11-11', '55566677788', 1),
(3, 8, 120.00, '2025-11-12', '99988877766', 2),
(4, 22, 200.00, '2025-11-13', '44433322211', 3),
(5, 5, 160.00, '2025-11-14', '77788899900', 3),
(6, 18, 175.00, '2025-11-10', '12345678909', 1),
(7, 7, 190.00, '2025-11-11', '98765432100', 2),
(8, 33, 210.00, '2025-11-12', '45678912345', 4),
(9, 14, 130.00, '2025-11-13', '78912345678', 5),
(10, 9, 140.00, '2025-11-14', '32165498732', 6),
(11, 25, 220.00, '2025-11-15', '65498732165', 7),
(12, 3, 110.00, '2025-11-16', '14725836914', 8),
(13, 28, 230.00, '2025-11-17', '25836914725', 9),
(14, 16, 170.00, '2025-11-18', '36914725836', 10),
(15, 11, 155.00, '2025-11-19', '95175386495', 1);

SELECT * FROM Motorista;

SELECT * FROM ONIBUS;

SELECT * FROM Passagem;

SELECT * FROM realiza;

SELECT * FROM ROTA;

SELECT * FROM VIAGENS;