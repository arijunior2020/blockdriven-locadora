# 🎬 Projeto BlockDriven - Locadora de DVDs

Este projeto foi desenvolvido como parte do desafio de modelagem de banco de dados.  
O objetivo é projetar o modelo de dados da **última locadora de DVDs do mundo**, seguindo boas práticas de normalização (até 3FN) e implementando em **PostgreSQL**.

---

## 📊 Diagrama do Banco de Dados

![Modelo ER](./blockdriven-locadora-image.png)

O diagrama acima representa o modelo entidade-relacionamento (ER) do banco de dados da locadora, incluindo todas as entidades, atributos e relacionamentos necessários para atender aos requisitos do sistema.

---

## 🐘 Script SQL

O arquivo [`blockdriven-locadora.sql`](./blockdriven-locadora.sql) contém todas as instruções para criar o banco no PostgreSQL:

- Criação das tabelas
- Definição de **Primary Keys** e **Foreign Keys**
- Constraints (`NOT NULL`, `UNIQUE`, `CHECK`, `ON DELETE CASCADE`)
- Relacionamentos N:N (através das tabelas associativas)

---

## 🎥 Vídeo Explicativo

Apresentação em até 5 minutos explicando o modelo e as decisões de projeto:  
👉 [Assista ao vídeo aqui](COLE_O_LINK_DO_SEU_VIDEO_AQUI)

---

## ✅ Requisitos atendidos

- Cadastro de clientes com múltiplos telefones  
- Estrutura hierárquica de endereços (país → estado → cidade → bairro → endereço)  
- Filmes organizados por categorias e atores relacionados  
- Discos físicos com número de registro e código de barras únicos  
- Registro de locações com datas, preço pago e multa  
- Relacionamento N:N entre locações e discos  
- Pesquisa de satisfação após devolução (nota 0–10)  

---

## 🚀 Tecnologias Utilizadas
- PostgreSQL 🐘
- DrawSQL (modelagem visual)
- Git & GitHub (versionamento e entrega)

---

## 👨‍💻 Autor
Projeto desenvolvido por **Arimatéia Júnior**.
