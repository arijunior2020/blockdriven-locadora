-- ======================================
-- PAIS / ESTADO / CIDADE / BAIRRO / ENDERECO
-- ======================================
CREATE TABLE pais (
    id_pais SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE estado (
    id_estado SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    sigla CHAR(2) NOT NULL,
    id_pais INT NOT NULL REFERENCES pais(id_pais)
);

CREATE TABLE cidade (
    id_cidade SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    id_estado INT NOT NULL REFERENCES estado(id_estado)
);

CREATE TABLE bairro (
    id_bairro SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    id_cidade INT NOT NULL REFERENCES cidade(id_cidade)
);

CREATE TABLE endereco (
    id_endereco SERIAL PRIMARY KEY,
    id_bairro INT NOT NULL REFERENCES bairro(id_bairro),
    rua VARCHAR(100) NOT NULL,
    numero VARCHAR(10) NOT NULL,
    complemento VARCHAR(50),
    cep CHAR(8) NOT NULL
);

-- ======================================
-- CLIENTE E TELEFONES
-- ======================================
CREATE TABLE cliente (
    id_cliente SERIAL PRIMARY KEY,
    nome_completo VARCHAR(150) NOT NULL,
    cpf CHAR(11) NOT NULL UNIQUE,
    telefone_principal VARCHAR(20) NOT NULL,
    id_endereco INT NOT NULL REFERENCES endereco(id_endereco)
);

CREATE TABLE telefone_cliente (
    id_telefone SERIAL PRIMARY KEY,
    id_cliente INT NOT NULL REFERENCES cliente(id_cliente) ON DELETE CASCADE,
    numero VARCHAR(20) NOT NULL,
    tipo VARCHAR(20) NOT NULL CHECK (tipo IN ('fixo','celular','outro'))
);

-- ======================================
-- FILMES / ATORES / CATEGORIAS
-- ======================================
CREATE TABLE categoria (
    id_categoria SERIAL PRIMARY KEY,
    nome VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE filme (
    id_filme SERIAL PRIMARY KEY,
    titulo VARCHAR(200) NOT NULL,
    duracao_min INT NOT NULL CHECK (duracao_min > 0),
    id_categoria INT NOT NULL REFERENCES categoria(id_categoria)
);

CREATE TABLE ator (
    id_ator SERIAL PRIMARY KEY,
    nome_completo VARCHAR(150) NOT NULL,
    data_nascimento DATE NOT NULL,
    id_pais INT NOT NULL REFERENCES pais(id_pais)
);

CREATE TABLE filme_ator (
    id_filme INT NOT NULL REFERENCES filme(id_filme) ON DELETE CASCADE,
    id_ator INT NOT NULL REFERENCES ator(id_ator) ON DELETE CASCADE,
    PRIMARY KEY (id_filme, id_ator)
);

-- ======================================
-- DISCOS
-- ======================================
CREATE TABLE disco (
    id_disco SERIAL PRIMARY KEY,
    id_filme INT NOT NULL REFERENCES filme(id_filme),
    numero_registro VARCHAR(50) NOT NULL UNIQUE,
    codigo_barras VARCHAR(100) NOT NULL UNIQUE
);

-- ======================================
-- LOCAÇÃO
-- ======================================
CREATE TABLE locacao (
    id_locacao SERIAL PRIMARY KEY,
    id_cliente INT NOT NULL REFERENCES cliente(id_cliente),
    data_locacao DATE NOT NULL DEFAULT CURRENT_DATE,
    data_prevista DATE NOT NULL,
    data_devolucao DATE,
    preco_pago NUMERIC(8,2) NOT NULL CHECK (preco_pago >= 0),
    multa NUMERIC(8,2) DEFAULT 0 CHECK (multa >= 0)
);

CREATE TABLE locacao_disco (
    id_locacao INT NOT NULL REFERENCES locacao(id_locacao) ON DELETE CASCADE,
    id_disco INT NOT NULL REFERENCES disco(id_disco),
    PRIMARY KEY (id_locacao, id_disco)
);

-- ======================================
-- PESQUISA DE SATISFAÇÃO
-- ======================================
CREATE TABLE pesquisa_satisfacao (
    id_pesquisa SERIAL PRIMARY KEY,
    id_locacao INT NOT NULL UNIQUE REFERENCES locacao(id_locacao) ON DELETE CASCADE,
    nota_atendimento INT NOT NULL CHECK (nota_atendimento BETWEEN 0 AND 10),
    nota_filme INT NOT NULL CHECK (nota_filme BETWEEN 0 AND 10)
);
