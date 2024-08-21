/* Projeto_BDD_modelo_Logico: */

CREATE TABLE Pessoa (
    CPF CHAR PRIMARY KEY,
    RG CHAR,
    Condicao_Pessoa CHAR,
    Nome_pessoa CHAR,
    Gênero CHAR,
    Etnia CHAR,
    Data_Nascimento DATE,
    Nascionalidade CHAR,
    Escolaridade CHAR,
    Profissão CHAR,
    Situação_Emprego CHAR,
    Renda_Mensal NUMERIC,
    Resumo_Caso CHAR,
    Materia_Caso CHAR,
    PF_ou_PJ CHAR,
    Enquadra_Lei BOOLEAN,
    Comunidade_LGBTQIA BOOLEAN,
    Usa_WhatsApp BOOLEAN,
    Rua CHAR,
    CEP CHAR,
    Bairro CHAR,
    Numero NUMERIC,
    Cidade CHAR
);

CREATE TABLE Atendimento (
    hora_chegada TIME,
    hora_atendimento TIME,
    cod_atendimento NUMERIC PRIMARY KEY,
    como_soube CHAR,
    data_atendimento DATE,
    nome_atendente CHAR
);

CREATE TABLE Estagiario (
    cod_estag NUMERIC PRIMARY KEY,
    data_atrib DATE,
    hora_atrib TIME,
    tipo_estag CHAR,
    nome_estag CHAR,
    celular_estag CHAR,
    email_estag CHAR
);

CREATE TABLE Advogado (
    oab_adv NUMERIC PRIMARY KEY,
    nome_adv CHAR,
    especialidade_adv CHAR,
    cpf_adv CHAR,
    email_adv CHAR,
    celular_adv CHAR,
    ano_ingresso DATE
);

CREATE TABLE Caso (
    prazosimples DATE,
    prazodobrado DATE,
    audiencia CHAR,
    temprazodobro BOOLEAN,
    numprocesso NUMERIC PRIMARY KEY,
    tema CHAR,
    polo CHAR,
    proxtarefa CHAR,
    obsprazo CHAR,
    dtproposicao DATE,
    data_controle DATE,
    FK_Estagiario_cod_estag NUMERIC,
    diaproxcontrole DATE,
    movimentacao CHAR
);

CREATE TABLE Agendamento (
    cod_agendamento NUMERIC PRIMARY KEY,
    data_agendamento DATE,
    data_inscricao DATE,
    resumo_consulta CHAR,
    area_direito CHAR,
    tipo_orientacao CHAR,
    numautos NUMERIC,
    prazojudicial DATE,
    hora_agendamento TIME,
    hora_inscricao TIME
);

CREATE TABLE Automovel (
    FK_pessoa_cpf CHAR,
    Id_Automóvel NUMERIC PRIMARY KEY,
    Valor_Automóvel NUMERIC
);

CREATE TABLE Terreno (
    FK_pessoa_cpf CHAR,
    Id_terreno NUMERIC PRIMARY KEY,
    Valor_Terreno NUMERIC
);

CREATE TABLE Imovel_Comercial (
    FK_pessoa_cpf CHAR,
    Id_Imóvel NUMERIC PRIMARY KEY,
    Valor_Imóvel NUMERIC
);

CREATE TABLE Apartamento (
    FK_pessoa_cpf CHAR,
    Id_apartamento NUMERIC PRIMARY KEY,
    Valor_Apartamento NUMERIC
);

CREATE TABLE Investimentos (
    FK_pessoa_cpf CHAR,
    Id_investimento NUMERIC PRIMARY KEY,
    Valor_Investimento NUMERIC
);

CREATE TABLE Casa_Proria (
    FK_pessoa_cpf CHAR,
    Id_casa NUMERIC PRIMARY KEY,
    Valor_Casa NUMERIC
);

CREATE TABLE Email (
    FK_pessoa_cpf CHAR,
    endereco_email CHAR,
    id_email NUMERIC,
    PRIMARY KEY (id_email, endereco_email)
);

CREATE TABLE Investimentos (
    FK_pessoa_cpf CHAR,
    id_beneficio NUMERIC PRIMARY KEY,
    Valor_Beneficio NUMERIC
);

CREATE TABLE Filhos (
    FK_pessoa_cpf CHAR,
    Id_Filho NUMERIC PRIMARY KEY
);

CREATE TABLE Tratamento_médico (
    FK_pessoa_cpf CHAR,
    id_tratamento NUMERIC PRIMARY KEY,
    Gastos_tratamento NUMERIC
);

CREATE TABLE Entidade_Familiar (
    FK_pessoa_cpf CHAR,
    Id_pessoa NUMERIC PRIMARY KEY,
    Ganhos_mensais NUMERIC
);

CREATE TABLE Telefone (
    FK_pessoa_cpf CHAR,
    Num_Telefone CHAR PRIMARY KEY
);

CREATE TABLE Pessoa_Atend (
    CPF CHAR,
    Cod_atendimento NUMERIC,
    FK_pessoa_cpf CHAR,
    FK_atendimento_cod_atendimento NUMERIC,
    PRIMARY KEY (CPF, Cod_atendimento)
);

CREATE TABLE Atend_Estag (
    cod_estag NUMERIC,
    cod_atendimento NUMERIC,
    FK_Atendimento_cod_atendimento NUMERIC,
    FK_Estagiario_cod_estag NUMERIC,
    PRIMARY KEY (cod_atendimento, cod_estag)
);

CREATE TABLE Estag_Caso (
    cod_estag NUMERIC,
    numprocesso NUMERIC,
    FK_Estagiario_cod_estag NUMERIC,
    FK_Caso_numeroprocesso NUMERIC,
    PRIMARY KEY (cod_estag, numprocesso)
);

CREATE TABLE Pessoa_Estag (
    cod_estag NUMERIC,
    cpf CHAR,
    FK_Estagiario_cod_estag NUMERIC,
    FK_pessoa_cpf CHAR,
    PRIMARY KEY (cpf, cod_estag)
);

CREATE TABLE Agd_Estag (
    cod_estag NUMERIC,
    cod_agendamento NUMERIC,
    FK_Estagiario_cod_estag NUMERIC,
    FK_Agendamento_cod_agendamento NUMERIC,
    PRIMARY KEY (cod_estag, cod_agendamento)
);

CREATE TABLE Agn_Adv (
    oab_adv NUMERIC,
    cod_agendamento NUMERIC,
    FK_Agendamento_cod_agendamento NUMERIC,
    FK_Advogado_oab_adv NUMERIC,
    PRIMARY KEY (cod_agendamento, oab_adv)
);

CREATE TABLE Disponibilidade (
    FK_Advogado_oab_adv NUMERIC,
    diasemana DATE,
    hora_init TIME,
    hora_fim TIME,
    formato CHAR,
    PRIMARY KEY (diasemana, hora_init, hora_fim)
);

CREATE TABLE Pessoa_ADV (
    oab_adv NUMERIC,
    cpf CHAR,
    FK_Advogado_oab_adv NUMERIC,
    FK_Pessoa_cpf CHAR,
    PRIMARY KEY (cpf, oab_adv)
);
