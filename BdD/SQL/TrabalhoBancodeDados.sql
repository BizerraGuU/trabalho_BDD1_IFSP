/* Projeto_BDD_modelo_Logico: */

/*CRIANDO O BANCO DE DADOS*/
CREATE DATABASE DJA;

/*SELECIONANDO QUAL BANCO DE DADOS SERÁ UTILIZADO*/
USE DJA;

/*------CODIFICAÇÃO PARA CRIAÇÃO DAS TABELAS------*/

/*TABELA PESSOA - ENTIDADE PRINCIPAL*/
CREATE TABLE Pessoa (
    CPF VARCHAR(11) PRIMARY KEY,
    RG VARCHAR(9),
    Condicao_Pessoa VARCHAR(6),
    Nome_pessoa VARCHAR(30),
    Gênero CHAR,
    Etnia VARCHAR(12),
    Data_Nascimento DATE,
    Nascionalidade VARCHAR(15),
    Escolaridade VARCHAR(20),
    Profissão VARCHAR(25),
    Situação_Emprego VARCHAR(12),
    Renda_Mensal NUMERIC,
    Resumo_Caso VARCHAR(100),
    Materia_Caso VARCHAR(20),
    PF_ou_PJ VARCHAR(2),
    Enquadra_Lei BOOLEAN,
    Comunidade_LGBTQIA BOOLEAN,
    Usa_WhatsApp BOOLEAN,
    Rua VARCHAR(25),
    CEP VARCHAR(15),
    Bairro VARCHAR(25),
    Numero NUMERIC,
    Cidade VARCHAR(25)
);

/*TABELA ATENDIMENTO - ENTIDADE PRINCIPAL*/
CREATE TABLE Atendimento (
    hora_chegada TIME,
    hora_atendimento TIME,
    cod_atendimento NUMERIC PRIMARY KEY,
    como_soube VARCHAR(30),
    data_atendimento DATE,
    nome_atendente VARCHAR(20)
);

/*TABELA ESTAGIARIO - ENTIDADE PRINCIPAL*/
CREATE TABLE Estagiario (
    cod_estag NUMERIC PRIMARY KEY,
    data_atrib DATE,
    hora_atrib TIME,
    tipo_estag VARCHAR(25),
    nome_estag VARCHAR(20),
    celular_estag VARCHAR(11),
    email_estag VARCHAR(30)
);

/*TABELA ADVOGADO - ENTIDADE PRINCIPAL*/
CREATE TABLE Advogado (
    oab_adv NUMERIC PRIMARY KEY,
    nome_adv VARCHAR(30),
    especialidade_adv VARCHAR(30),
    cpf_adv VARCHAR(11),
    email_adv VARCHAR(30),
    celular_adv VARCHAR(11),
    ano_ingresso DATE
);

/*TABELA CASO - ENTIDADE PRINCIPAL*/
CREATE TABLE Caso (
    prazosimples DATE,
    prazodobrado DATE,
    audiencia VARCHAR(20),
    temprazodobro BOOLEAN,
    numprocesso NUMERIC PRIMARY KEY,
    tema VARCHAR(40),
    polo VARCHAR(30),
    proxtarefa VARCHAR(50),
    obsprazo VARCHAR(30),
    dtproposicao DATE,
    data_controle DATE,
    FK_Estagiario_cod_estag NUMERIC,
    diaproxcontrole DATE,
    movimentacao VARCHAR(30)
);

/*AGENDAMENTO - ENTIDADE PRINCIPAL*/
CREATE TABLE Agendamento (
    cod_agendamento NUMERIC PRIMARY KEY,
    data_agendamento DATE,
    data_inscricao DATE,
    resumo_consulta VARCHAR(100),
    area_direito VARCHAR(35),
    tipo_orientacao VARCHAR(25),
    numautos NUMERIC,
    prazojudicial DATE,
    hora_agendamento TIME,
    hora_inscricao TIME
);

/*TABELA AUTOMOVEL - DERIVAÇÃO DA ENTIDADE PESSOA*/
CREATE TABLE Automovel (
    FK_pessoa_cpf VARCHAR(11),
    Id_Automóvel NUMERIC PRIMARY KEY,
    Valor_Automóvel NUMERIC
);

/*TABELA TERRENO - DERIVAÇÃO DA ENTIDADE PESSOA*/
CREATE TABLE Terreno (
    FK_pessoa_cpf VARCHAR(11),
    Id_terreno NUMERIC PRIMARY KEY,
    Valor_Terreno NUMERIC
);

/*TABELA IMOVEL COMERCIAL - DERIVAÇÃO DA ENTIDADE PESSOA*/
CREATE TABLE Imovel_Comercial (
    FK_pessoa_cpf VARCHAR(11),
    Id_Imóvel NUMERIC PRIMARY KEY,
    Valor_Imóvel NUMERIC
);

/*TABELA APARTAMENTO - DERIVAÇÃO DA ENTIDADE PESSOA*/
CREATE TABLE Apartamento (
    FK_pessoa_cpf VARCHAR(11),
    Id_apartamento NUMERIC PRIMARY KEY,
    Valor_Apartamento NUMERIC
);

/*TABELA INVESTIMENTOS - DERIVAÇÃO DA ENTIDADE PESSOA*/
CREATE TABLE Investimentos (
    FK_pessoa_cpf VARCHAR(11),
    Id_investimento NUMERIC PRIMARY KEY,
    Valor_Investimento NUMERIC
);

/*TABELA CASA PRÓPRIA - DERIVAÇÃO DA ENTIDADE PESSOA*/
CREATE TABLE Casa_Proria (
    FK_pessoa_cpf VARCHAR(11),
    Id_casa NUMERIC PRIMARY KEY,
    Valor_Casa NUMERIC
);

/*TABELA EMAIL - DERIVAÇÃO DA ENTIDADE PESSOA*/
CREATE TABLE Email (
    FK_pessoa_cpf VARCHAR(11),
    endereco_email VARCHAR(30),
    id_email NUMERIC,
    PRIMARY KEY (id_email, endereco_email)
);

/*TABELA FILHOS - DERIVAÇÃO DA ENTIDADE PESSOA*/
CREATE TABLE Filhos (
    FK_pessoa_cpf VARCHAR(11),
    Id_Filho NUMERIC PRIMARY KEY
);

/*TABELA TRATAMENTO MEDICO - DERIVAÇÃO DA ENTIDADE PESSOA*/
CREATE TABLE Tratamento_médico (
    FK_pessoa_cpf VARCHAR(11),
    id_tratamento NUMERIC PRIMARY KEY,
    Gastos_tratamento NUMERIC
);

/*TABELA ENTIDADE FAMILIAR - DERIVAÇÃO DA ENTIDADE PESSOA*/
CREATE TABLE Entidade_Familiar (
    FK_pessoa_cpf VARCHAR(11),
    Id_pessoa NUMERIC PRIMARY KEY,
    Ganhos_mensais NUMERIC
);

/*TABELA TELEFONE - DERIVAÇÃO DA ENTIDADE PESSOA*/
CREATE TABLE Telefone (
    FK_pessoa_cpf VARCHAR(11),
    Num_Telefone VARCHAR(11) PRIMARY KEY
);

/*TABELA PESSOA ATENDIMENTO - ENTIDADE ASSOCIATIVA (PESSOA E ATENDIMENTO)*/
CREATE TABLE Pessoa_Atend (
    CPF VARCHAR(11),
    Cod_atendimento NUMERIC,
    FK_pessoa_cpf VARCHAR(11),
    FK_atendimento_cod_atendimento NUMERIC,
    PRIMARY KEY (CPF, Cod_atendimento)
);

/*TABELA ATENDIMENTO ESTAGIARIO - ENTIDADE ASSOCIATIVA (ESTAGIARIO E ATENDIMENTO)*/
CREATE TABLE Atend_Estag (
    cod_estag NUMERIC,
    cod_atendimento NUMERIC,
    FK_Atendimento_cod_atendimento NUMERIC,
    FK_Estagiario_cod_estag NUMERIC,
    PRIMARY KEY (cod_atendimento, cod_estag)
);

/*TABELA ESTAGIARIO CASO - ENTIDADE ASSOCIATIVA (ESTAGIARIO E CASO)*/
CREATE TABLE Estag_Caso (
    cod_estag NUMERIC,
    numprocesso NUMERIC,
    FK_Estagiario_cod_estag NUMERIC,
    FK_Caso_numeroprocesso NUMERIC,
    PRIMARY KEY (cod_estag, numprocesso)
);

/*TABELA PESSOA ESTAGIARIO - ENTIDADE ASSOCIATIVA (ESTAGIARIO E PESSOA)*/
CREATE TABLE Pessoa_Estag (
    cod_estag NUMERIC,
    cpf VARCHAR(11),
    FK_Estagiario_cod_estag NUMERIC,
    FK_pessoa_cpf VARCHAR(11),
    PRIMARY KEY (cpf, cod_estag)
);

/*TABELA AGENDAMENTO ESTAGIARIO - ENTIDADE ASSOCIATIVA (ESTAGIARIO E AGENDAMENTO)*/
CREATE TABLE Agd_Estag (
    cod_estag NUMERIC,
    cod_agendamento NUMERIC,
    FK_Estagiario_cod_estag NUMERIC,
    FK_Agendamento_cod_agendamento NUMERIC,
    PRIMARY KEY (cod_estag, cod_agendamento)
);

/*TABELA AGENDAMENTO ADVOGADO - ENTIDADE ASSOCIATIVA (AGENDAMENTO E ADVOGADO)*/
CREATE TABLE Agn_Adv (
    oab_adv NUMERIC,
    cod_agendamento NUMERIC,
    FK_Agendamento_cod_agendamento NUMERIC,
    FK_Advogado_oab_adv NUMERIC,
    PRIMARY KEY (cod_agendamento, oab_adv)
);

/*TABELA DISPONIBILIDADE - ENTIDADE DERIVADA DO ADVOGADO*/
CREATE TABLE Disponibilidade (
    FK_Advogado_oab_adv NUMERIC,
    diasemana DATE,
    hora_init TIME,
    hora_fim TIME,
    formato VARCHAR(10),
    PRIMARY KEY (diasemana, hora_init, hora_fim)
);

/*TABELA PESSOA ADVOGADO - ENTIDADE ASSOCIATIVA (PESSOA E ADVOGADO)*/
CREATE TABLE Pessoa_ADV (
    oab_adv NUMERIC,
    cpf VARCHAR(11),
    FK_Advogado_oab_adv NUMERIC,
    FK_Pessoa_cpf VARCHAR(11),
    PRIMARY KEY (cpf, oab_adv)
);

/*-----------POPULANDO AS TABELAS-----------*/

-- Dados para a tabela Pessoa
INSERT INTO Pessoa VALUES
('12345678900', 'MG1234567', 'Ativo', 'João da Silva', 'M', 'Branco', '1985-04-15', 'Brasileiro', 'Superior Completo', 'Engenheiro', 'Empregado', 8000.00, 'Caso de Família', 'Divórcio', 'PF', TRUE, FALSE, TRUE, 'Rua A', '30140000', 'Centro', 123, 'Belo Horizonte'),
('98765432100', 'SP7654321', 'Ativo', 'Maria Oliveira', 'F', 'Parda', '1990-12-20', 'Brasileira', 'Médio Completo', 'Vendedora', 'Empregada', 2500.00, 'Caso de Trabalho', 'Indenização', 'PF', FALSE, TRUE, TRUE, 'Rua B', '04000000', 'Jardins', 45, 'São Paulo'),
('11122233344', 'RJ1122334', 'Ativo', 'Carlos Souza', 'M', 'Negro', '1978-07-30', 'Brasileiro', 'Superior Completo', 'Advogado', 'Autônomo', 12000.00, 'Caso de Direito Civil', 'Contratos', 'PF', TRUE, FALSE, TRUE, 'Rua C', '22230000', 'Copacabana', 789, 'Rio de Janeiro'),
('55566677788', 'RS5566778', 'Ativo', 'Ana Costa', 'F', 'Branca', '1983-01-25', 'Brasileira', 'Superior Completo', 'Médica', 'Empregada', 15000.00, 'Caso de Família', 'Guarda', 'PF', FALSE, TRUE, TRUE, 'Rua D', '90000000', 'Moinhos de Vento', 34, 'Porto Alegre'),
('99988877766', 'PR9988777', 'Ativo', 'Pedro Lima', 'M', 'Indígena', '1995-09-10', 'Brasileiro', 'Técnico', 'Técnico de Informática', 'Empregado', 4500.00, 'Caso de Consumidor', 'Defeito de Produto', 'PF', FALSE, FALSE, TRUE, 'Rua E', '80000000', 'Centro', 67, 'Curitiba');

SELECT * FROM Pessoa;

-- Dados para a tabela Atendimento
INSERT INTO Atendimento VALUES
('08:30:00', '09:00:00', 1, 'Indicação de amigo', '2024-01-15', 'Carlos Pereira'),
('09:15:00', '09:45:00', 2, 'Internet', '2024-01-16', 'Ana Almeida'),
('10:00:00', '10:30:00', 3, 'Redes sociais', '2024-01-17', 'Roberto Costa'),
('11:00:00', '11:30:00', 4, 'TV', '2024-01-18', 'Maria Fernandes'),
('13:00:00', '13:30:00', 5, 'Outdoor', '2024-01-19', 'Juliana Silva');

SELECT * FROM Atendimento;

-- Dados para a tabela Estagiario
INSERT INTO Estagiario VALUES
(101, '2024-01-20', '14:00:00', 'Direito Penal', 'João Estagiário', '31987654321', 'joao.estag@exemplo.com'),
(102, '2024-01-21', '15:00:00', 'Direito Civil', 'Ana Estagiária', '21987654322', 'ana.estag@exemplo.com'),
(103, '2024-01-22', '16:00:00', 'Direito Trabalhista', 'Carlos Estagiário', '11987654323', 'carlos.estag@exemplo.com'),
(104, '2024-01-23', '17:00:00', 'Direito Tributário', 'Maria Estagiária', '41987654324', 'maria.estag@exemplo.com'),
(105, '2024-01-24', '18:00:00', 'Direito Ambiental', 'Pedro Estagiário', '51987654325', 'pedro.estag@exemplo.com');

SELECT * FROM Estagiario;

-- Dados para a tabela Advogado
INSERT INTO Advogado VALUES
(12345, 'Dr. João Advogado', 'Penal', '12345678900', 'joao.adv@exemplo.com', '31987654321', '2005-03-10'),
(67890, 'Dra. Maria Advogada', 'Civil', '98765432100', 'maria.adv@exemplo.com', '21987654322', '2010-07-15'),
(11223, 'Dr. Carlos Advogado', 'Trabalhista', '11122233344', 'carlos.adv@exemplo.com', '11987654323', '2008-09-20'),
(44556, 'Dra. Ana Advogada', 'Tributário', '55566677788', 'ana.adv@exemplo.com', '41987654324', '2012-11-25'),
(77889, 'Dr. Pedro Advogado', 'Ambiental', '99988877766', 'pedro.adv@exemplo.com', '51987654325', '2015-02-28');

SELECT * FROM Advogado;

-- Dados para a tabela Caso
INSERT INTO Caso VALUES
('2024-03-01', '2024-03-15', 'Sim', TRUE, 1001, 'Divórcio', 'Autor', 'Revisão Documental', 'Entregar documentos', '2024-02-15', '2024-02-20', 101, '2024-03-10', 'Em andamento'),
('2024-04-01', '2024-04-15', 'Não', FALSE, 1002, 'Indenização', 'Réu', 'Aguarda Provas', 'Apresentar defesa', '2024-03-10', '2024-03-15', 102, '2024-04-10', 'Suspenso'),
('2024-05-01', '2024-05-15', 'Sim', TRUE, 1003, 'Contrato', 'Autor', 'Análise Jurídica', 'Revisão do contrato', '2024-04-10', '2024-04-20', 103, '2024-05-10', 'Em andamento'),
('2024-06-01', '2024-06-15', 'Não', FALSE, 1004, 'Guarda', 'Autor', 'Aguardando Audiência', 'Participação na audiência', '2024-05-10', '2024-05-15', 104, '2024-06-10', 'Pendente'),
('2024-07-01', '2024-07-15', 'Sim', TRUE, 1005, 'Defeito de Produto', 'Réu', 'Aguardando Documentos', 'Entregar documentos faltantes', '2024-06-10', '2024-06-20', 105, '2024-07-10', 'Em andamento');

SELECT * FROM Caso;

-- Dados para a tabela Agendamento
INSERT INTO Agendamento VALUES
(2001, '2024-01-15', '2024-01-10', 'Consulta inicial', 'Civil', 'Orientação Jurídica', 3001, '2024-02-01', '10:00:00', '09:30:00'),
(2002, '2024-01-16', '2024-01-11', 'Consulta trabalhista', 'Trabalhista', 'Orientação Jurídica', 3002, '2024-02-02', '11:00:00', '10:30:00'),
(2003, '2024-01-17', '2024-01-12', 'Consulta penal', 'Penal', 'Orientação Jurídica', 3003, '2024-02-03', '12:00:00', '11:30:00'),
(2004, '2024-01-18', '2024-01-13', 'Consulta tributária', 'Tributário', 'Orientação Jurídica', 3004, '2024-02-04', '13:00:00', '12:30:00'),
(2005, '2024-01-19', '2024-01-14', 'Consulta ambiental', 'Ambiental', 'Orientação Jurídica', 3005, '2024-02-05', '14:00:00', '13:30:00');

-- SELECT * FROM Agendamento;

-- Dados para a tabela Automovel
INSERT INTO Automovel VALUES
('12345678900', 1, 30000.00),
('98765432100', 2, 45000.00),
('11122233344', 3, 25000.00),
('55566677788', 4, 55000.00),
('99988877766', 5, 20000.00);

-- SELECT * FROM Automovel;

-- Dados para a tabela Terreno
INSERT INTO Terreno VALUES
('12345678900', 1, 100000.00),
('98765432100', 2, 150000.00),
('11122233344', 3, 80000.00),
('55566677788', 4, 120000.00),
('99988877766', 5, 90000.00);

-- SELECT * FROM Terreno;

-- Dados para a tabela Imovel_Comercial
INSERT INTO Imovel_Comercial VALUES
('12345678900', 1, 500000.00),
('98765432100', 2, 700000.00),
('11122233344', 3, 600000.00),
('55566677788', 4, 750000.00),
('99988877766', 5, 650000.00);

-- SELECT * FROM Imovel_Comercial;

-- Dados para a tabela Apartamento
INSERT INTO Apartamento VALUES
('12345678900', 1, 300000.00),
('98765432100', 2, 350000.00),
('11122233344', 3, 250000.00),
('55566677788', 4, 400000.00),
('99988877766', 5, 280000.00);

-- SELECT * FROM Apartamento;

-- Dados para a tabela Investimentos
INSERT INTO Investimentos VALUES
('12345678900', 1, 150000.00),
('98765432100', 2, 200000.00),
('11122233344', 3, 100000.00),
('55566677788', 4, 180000.00),
('99988877766', 5, 120000.00);

-- SELECT * FROM Investimentos;

-- Dados para a tabela Casa_Proria
INSERT INTO Casa_Proria VALUES
('12345678900', 1, 600000.00),
('98765432100', 2, 800000.00),
('11122233344', 3, 550000.00),
('55566677788', 4, 750000.00),
('99988877766', 5, 700000.00);

-- SELECT * FROM Casa_Proria;

-- Dados para a tabela Email
INSERT INTO Email VALUES
('12345678900', 'joao.silva@exemplo.com', 1),
('98765432100', 'maria.oliveira@exemplo.com', 2),
('11122233344', 'carlos.souza@exemplo.com', 3),
('55566677788', 'ana.costa@exemplo.com', 4),
('99988877766', 'pedro.lima@exemplo.com', 5);

-- SELECT * FROM Email;

-- Dados para a tabela Filhos
INSERT INTO Filhos VALUES
('12345678900', 1),
('98765432100', 2),
('11122233344', 3),
('55566677788', 4),
('99988877766', 5);

-- SELECT * FROM Filhos;

-- Dados para a tabela Tratamento_médico
INSERT INTO Tratamento_médico VALUES
('12345678900', 1, 5000.00),
('98765432100', 2, 12000.00),
('11122233344', 3, 8000.00),
('55566677788', 4, 15000.00),
('99988877766', 5, 7000.00);

-- SELECT * FROM Tratamento_médico;

-- Dados para a tabela Entidade_Familiar
INSERT INTO Entidade_Familiar VALUES
('12345678900', 1, 10000.00),
('98765432100', 2, 15000.00),
('11122233344', 3, 8000.00),
('55566677788', 4, 12000.00),
('99988877766', 5, 9000.00);

-- SELECT * FROM Entidade_Familiar;

-- Dados para a tabela Telefone
INSERT INTO Telefone VALUES
('12345678900', '31987654321'),
('98765432100', '21987654322'),
('11122233344', '11987654323'),
('55566677788', '41987654324'),
('99988877766', '51987654325');

-- SELECT * FROM Telefone;

-- Dados para a tabela Pessoa_Atend
INSERT INTO Pessoa_Atend VALUES
('12345678900', 1, '12345678900', 1),
('98765432100', 2, '98765432100', 2),
('11122233344', 3, '11122233344', 3),
('55566677788', 4, '55566677788', 4),
('99988877766', 5, '99988877766', 5);

-- SELECT * FROM Pessoa_Atend;

-- Dados para a tabela Atend_Estag
INSERT INTO Atend_Estag VALUES
(101, 1, 1, 101),
(102, 2, 2, 102),
(103, 3, 3, 103),
(104, 4, 4, 104),
(105, 5, 5, 105);

-- SELECT * FROM Atend_Estag;

-- Dados para a tabela Estag_Caso
INSERT INTO Estag_Caso VALUES
(101, 1001, 101, 1001),
(102, 1002, 102, 1002),
(103, 1003, 103, 1003),
(104, 1004, 104, 1004),
(105, 1005, 105, 1005);

-- SELECT * FROM Estag_Caso;

-- Dados para a tabela Pessoa_Estag
INSERT INTO Pessoa_Estag VALUES
(101, '12345678900', 101, '12345678900'),
(102, '98765432100', 102, '98765432100'),
(103, '11122233344', 103, '11122233344'),
(104, '55566677788', 104, '55566677788'),
(105, '99988877766', 105, '99988877766');

-- SELECT * FROM Pessoa_Estag;

-- Dados para a tabela Agd_Estag
INSERT INTO Agd_Estag VALUES
(101, 2001, 101, 2001),
(102, 2002, 102, 2002),
(103, 2003, 103, 2003),
(104, 2004, 104, 2004),
(105, 2005, 105, 2005);

-- SELECT * FROM Agd_Estag;

-- Dados para a tabela Agn_Adv
INSERT INTO Agn_Adv VALUES
(12345, 2001, 2001, 12345),
(67890, 2002, 2002, 67890),
(11223, 2003, 2003, 11223),
(44556, 2004, 2004, 44556),
(77889, 2005, 2005, 77889);

-- SELECT * FROM Agn_Adv;

-- Dados para a tabela Disponibilidade
INSERT INTO Disponibilidade VALUES
(12345, '2024-01-15', '08:00:00', '12:00:00', 'Presencial'),
(67890, '2024-01-16', '09:00:00', '13:00:00', 'Online'),
(11223, '2024-01-17', '10:00:00', '14:00:00', 'Presencial'),
(44556, '2024-01-18', '11:00:00', '15:00:00', 'Online'),
(77889, '2024-01-19', '12:00:00', '16:00:00', 'Presencial');

-- SELECT * FROM Disponibilidade;

-- Dados para a tabela Pessoa_ADV
INSERT INTO Pessoa_ADV VALUES
(12345, '12345678900', 12345, '12345678900'),
(67890, '98765432100', 67890, '98765432100'),
(11223, '11122233344', 11223, '11122233344'),
(44556, '55566677788', 44556, '55566677788'),
(77889, '99988877766', 77889, '99988877766');

-- SELECT * FROM Pessoa_ADV;

/*------CODIFICAÇÃO INSERIR NOVOS VALORES NAS TABELAS------*/

-- Inserindo um novo registro na tabela Pessoa
INSERT INTO Pessoa (CPF, RG, Condicao_Pessoa, Nome_pessoa, Gênero, Etnia, Data_Nascimento, Nascionalidade, Escolaridade, Profissão, Situação_Emprego, Renda_Mensal, Resumo_Caso, Materia_Caso, PF_ou_PJ, Enquadra_Lei, Comunidade_LGBTQIA, Usa_WhatsApp, Rua, CEP, Bairro, Numero, Cidade)
VALUES ('11133355577', 'MG1234567', 'Ativa', 'Lucas Almeida', 'M', 'Branco', '1985-07-21', 'Brasileiro', 'Ensino Médio', 'Motorista', 'Empregado', 2500.00, 'Roubo de carga', 'Penal', 'PF', FALSE, FALSE, TRUE, 'Rua das Flores', '30123-000', 'Centro', 101, 'Belo Horizonte');

SELECT * FROM Pessoa;

-- Inserindo um novo registro na tabela Atendimento
INSERT INTO Atendimento (hora_chegada, hora_atendimento, cod_atendimento, como_soube, data_atendimento, nome_atendente)
VALUES ('09:30:00', '10:00:00', 1006, 'Indicação', '2024-08-20', 'Carla Pereira');

SELECT * FROM Atendimento;

-- Inserindo um novo registro na tabela Estagiario
INSERT INTO Estagiario (cod_estag, data_atrib, hora_atrib, tipo_estag, nome_estag, celular_estag, email_estag)
VALUES (106, '2024-08-20', '14:00:00', 'Penal', 'Julia Mendes', '31999999999', 'julia.mendes@exemplo.com');

SELECT * FROM Estagiario;

-- Inserindo um novo registro na tabela Advogado
INSERT INTO Advogado (oab_adv, nome_adv, especialidade_adv, cpf_adv, email_adv, celular_adv, ano_ingresso)
VALUES (67891, 'Dr. Paulo Silva', 'Trabalhista', '22244466688', 'paulo.silva@adv.com', '31988888888', '2010-03-15');

SELECT * FROM Advogado;

-- Inserindo um novo registro na tabela Caso
INSERT INTO Caso (prazosimples, prazodobrado, audiencia, temprazodobro, numprocesso, tema, polo, proxtarefa, obsprazo, dtproposicao, data_controle, FK_Estagiario_cod_estag, diaproxcontrole, movimentacao)
VALUES ('2024-09-15', '2024-10-01', 'Sim', TRUE, 2006, 'Direitos Trabalhistas', 'Ativo', 'Revisão de provas', 'Prazo de 15 dias', '2024-08-01', '2024-08-21', 106, '2024-08-31', 'Movimentação inicial');

SELECT * FROM Caso;

/*------CODIFICAÇÃO PARA CONSULTA ESPECIFICA NAS TABELAS------*/

-- Consultando registros na tabela Pessoa
SELECT * FROM Pessoa WHERE Nome_pessoa = 'Lucas Almeida';

-- Consultando registros na tabela Atendimento
SELECT * FROM Atendimento WHERE data_atendimento = '2024-08-20';

-- Consultando registros na tabela Estagiario
SELECT * FROM Estagiario WHERE tipo_estag = 'Penal';

-- Consultando registros na tabela Advogado
SELECT * FROM Advogado WHERE especialidade_adv = 'Trabalhista';

-- Consultando registros na tabela Caso
SELECT * FROM Caso WHERE tema = 'Direitos Trabalhistas';

/*------CODIFICAÇÃO PARA ALTERAR DADOS NAS TABELAS-----*/

-- Alterando um registro na tabela Pessoa
UPDATE Pessoa
SET Renda_Mensal = 3000.00, Situação_Emprego = 'Autônomo'
WHERE CPF = '11133355577';

SELECT * FROM Pessoa;

-- Alterando um registro na tabela Atendimento
UPDATE Atendimento
SET hora_atendimento = '10:30:00', nome_atendente = 'Marcos Silva'
WHERE cod_atendimento = 1006;

SELECT * FROM Atendimento;

-- Alterando um registro na tabela Estagiario
UPDATE Estagiario
SET celular_estag = '31998765432'
WHERE cod_estag = 106;

SELECT * FROM Estagiario;

-- Alterando um registro na tabela Advogado
UPDATE Advogado
SET email_adv = 'paulo.silva@novaadv.com'
WHERE oab_adv = 67891;

SELECT * FROM Advogado;

-- Alterando um registro na tabela Caso
UPDATE Caso
SET proxtarefa = 'Entrevista com testemunhas', obsprazo = 'Prazo estendido para 20 dias'
WHERE numprocesso = 2006;

SELECT * FROM Caso;

/*------CODIFICAÇÃO PARA EXCLUIR DADOS DAS TABELAS------*/

-- Excluindo um registro na tabela Pessoa
DELETE FROM Pessoa
WHERE CPF = '11133355577';

SELECT * FROM Pessoa;

-- Excluindo um registro na tabela Atendimento
DELETE FROM Atendimento
WHERE cod_atendimento = 1006;

SELECT * FROM Atendimento;

-- Excluindo um registro na tabela Estagiario
DELETE FROM Estagiario
WHERE cod_estag = 106;

SELECT * FROM Estagiario;

-- Excluindo um registro na tabela Advogado
DELETE FROM Advogado
WHERE oab_adv = 67891;

SELECT * FROM Advogado;

-- Excluindo um registro na tabela Caso
DELETE FROM Caso
WHERE numprocesso = 2006;

SELECT * FROM Caso;


