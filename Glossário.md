# 📚 Banco de Dados

## *Banco de Dados*
Um banco de dados é um sistema organizado para armazenar, gerenciar e recuperar informações de maneira eficiente. Funciona como uma "biblioteca digital", onde os dados são estruturados em tabelas (no caso dos relacionais), com linhas (registros) e colunas (campos).

### Tipos de Banco de Dados:
- **Relacional**: Usa tabelas e a linguagem SQL.  
  Exemplos: MySQL, PostgreSQL, Oracle.
- **Não-relacional (NoSQL)**: Usa estruturas flexíveis como documentos, grafos ou chave-valor.  
  Exemplos: MongoDB, Cassandra, Redis.

Esses sistemas são fundamentais em websites, aplicativos, sistemas financeiros, redes sociais, etc.

---

## *Sistema Gerenciador de Banco de Dados (SGBD)*

Software que permite criar, gerenciar e manter bancos de dados. Ele garante que os dados sejam acessados com segurança, integridade e desempenho, permitindo operações CRUD (Create, Read, Update, Delete).

### Funções principais de um SGBD:
- **Armazenamento de Dados**: Estrutura e organiza os dados.
- **Controle de Acesso**: Garante segurança e autenticação.
- **Segurança e Integridade**: Protege contra falhas e inconsistências.
- **Consultas e Manipulação**: Usa SQL para interagir com os dados.
- **Backup e Recuperação**: Garante disponibilidade dos dados.

### Exemplos:
- **Relacionais**: MySQL, PostgreSQL, Oracle, SQL Server.
- **NoSQL**: MongoDB, Cassandra, Redis.

---

## *Relação entre Banco de Dados e SGBD*

- **Banco de Dados**: Local onde os dados são armazenados. Ex: arquivos, tabelas.
- **SGBD**: Sistema que gerencia o banco. Ex: permite criar tabelas, inserir dados, controlar acesso.

### O SGBD oferece ferramentas para:
- Criar e manter estruturas como tabelas e índices.
- Armazenar e recuperar dados.
- Executar consultas (ex: `SELECT` em SQL).
- Garantir integridade, segurança e desempenho.

---

## *Modelo Relacional de Banco de Dados*

Modelo baseado em **tabelas** para representar dados, proposto por **E.F. Codd em 1970**.

### Características:
- **Tabelas (Relações)**: Conjuntos de registros e campos.
- **Chaves Primárias**: Identificam unicamente cada registro.
- **Chaves Estrangeiras**: Ligam tabelas diferentes.
- **Integridade Referencial**: Garante consistência entre os dados.
- **SQL**: Linguagem usada para manipular e consultar os dados.

### 📌 Exemplo Prático

#### Tabela de Clientes:

| ID_Cliente | Nome | Email           |
|------------|------|------------------|
| 1          | João | joao@email.com   |
| 2          | Maria| maria@email.com  |

#### Tabela de Pedidos:

| ID_Pedido | Data       | ID_Cliente (FK) |
|-----------|------------|-----------------|
| 101       | 2025-02-10 | 1               |
| 102       | 2025-02-11 | 2               |

> `ID_Cliente` na tabela de pedidos é uma **chave estrangeira** que referencia a tabela de clientes.

### Vantagens:
- Simplicidade e clareza.
- Flexibilidade na manutenção.
- Integridade e consistência dos dados.
- Consultas eficientes com SQL.

---

## *Microserviço*

### Definição
Arquitetura onde a aplicação é dividida em **serviços independentes**, cada um com responsabilidade específica. Eles se comunicam via **APIs**.

### Características:
- **Independência**: Serviços autônomos, fáceis de escalar.
- **Foco por Domínio**: Cada microserviço cuida de um módulo (ex: login, pedidos).
- **Comunicação via APIs**: REST, gRPC, Kafka, etc.
- **Escalabilidade**: Cada serviço pode ser escalado separadamente.
- **Banco de Dados Descentralizado**: Cada serviço pode ter seu próprio banco.

### Vantagens:
- Escalabilidade e resiliência.
- Desenvolvimento ágil com equipes independentes.
- Flexibilidade tecnológica.
- Manutenção facilitada.

### Desvantagens:
- Complexidade de gerenciamento.
- Maior latência e problemas de consistência de dados.

### 🧩 Exemplo:
Em um sistema de e-commerce:
- Microserviço de autenticação
- Microserviço de estoque
- Microserviço de pedidos
- Microserviço de pagamento

---

## *Processo de Design de Banco de Dados*

### 1. Modelagem de Dados

#### • Modelo Conceitual:
- Diagrama ER (Entidade-Relacionamento)
- Foca em entidades e relacionamentos

#### • Modelo Lógico:
- Estrutura próxima da implementação
- Define tipos de dados, chaves primárias e estrangeiras
- Aplica **normalização**

#### • Normalização:
- Elimina redundância
- Organiza dados em múltiplas tabelas

### 2. Escolha do SGBD
- Com base nas necessidades: SQL (MySQL, PostgreSQL), NoSQL (MongoDB, etc.)

### 4. Definição de Consultas e Procedimentos
```sql
SELECT nome, email FROM cliente;

SELECT COUNT(*) FROM pedido WHERE id_cliente = 1;
```

### 3. Criação de Esquemas e Tabelas

```sql
CREATE TABLE cliente (
    id_cliente INT PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(100)
);

CREATE TABLE pedido (
    id_pedido INT PRIMARY KEY,
    data DATE,
    id_cliente INT,
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)
);

SELECT nome, email FROM cliente;

SELECT COUNT(*) FROM pedido WHERE id_cliente = 1;
```
### 5. Segurança e Backup

- **Definição de permissões por usuário**: Controle de quem pode acessar e manipular dados.
- **Políticas regulares de backup e recuperação**: Criação de cópias de segurança e estratégias de restauração em caso de falhas.
- **Controle de acesso com autenticação e criptografia**: Garantia de que somente usuários autorizados acessem os dados, com proteção contra interceptações.

---

### 6. Performance e Escalabilidade

- **Índices**: Estruturas criadas sobre colunas de tabelas para acelerar o tempo de resposta de consultas.
- **Particionamento (Sharding)**: Divisão de grandes tabelas ou bancos em partes menores e distribuídas.
- **Replicação**: Manutenção de cópias dos dados em múltiplos servidores para melhorar disponibilidade e tolerância a falhas.
- **Monitoramento**: Uso de ferramentas como *Prometheus* e *Grafana* para acompanhar métricas de desempenho e saúde do sistema.
- **Balanceamento de carga**: Distribuição de requisições entre diversas instâncias de servidores para evitar sobrecarga.

---
# Banco de Dados Relacional e Projeto de Banco de Dados

## 1. Conceitos Fundamentais

Um **Banco de Dados Relacional** organiza os dados em **tabelas** com colunas (atributos) e linhas (tuplas), permitindo relacionamentos entre elas. Todo banco precisa de um **SGBD** (Sistema Gerenciador de Banco de Dados) e de uma **linguagem de consulta**, como a **SQL**.

O SGBD oferece:
- Manipulação de dados
- Segurança
- Backup
- Integridade e controle de transações (ACID):
  - **A**tomicidade
  - **C**onsistência
  - **I**solamento
  - **D**urabilidade

## 2. Linguagens SQL

- **DDL (Data Definition Language)**: criação e modificação da estrutura do banco  
  Ex: `CREATE`, `DROP`

- **DML (Data Manipulation Language)**: manipulação dos dados  
  Ex: `SELECT`, `INSERT`, `UPDATE`, `DELETE`

## 3. Modelagem de Banco de Dados

- **Modelagem Conceitual**: diagrama com entidades, atributos e relacionamentos.
- **Modelagem Lógica**: tabelas, chaves primárias/estrangeiras e relacionamentos (1:1, 1:N, N:M).
- **Modelagem Física**: tipos de dados, restrições, índices e integridade no SGBD.

**Boas práticas:**
- Reduzir a quantidade de tabelas quando possível
- Evitar atributos nulos
- Manter chaves primárias simples

## 4. Álgebra Relacional em SQL

### Projeção (π) – seleção de colunas

```sql
SELECT alunoId FROM aluno;

SELECT nome, curso FROM aluno;
``

### Seleção (σ) – com condição

```sql
SELECT nome FROM aluno WHERE curso = 1;

SELECT nome, alunoId FROM aluno WHERE curso IS NULL;

SELECT nome, alunoId FROM aluno WHERE curso = 1 OR curso = 3;
```
### União (OR lógico)

```sql
SELECT nome FROM aluno WHERE curso = 1 OR curso = 3;
```

### Interseção (AND lógico)

```sql
SELECT nome FROM aluno WHERE curso = 1 AND alunoId > 1000;
```

### Produto Cartesiano

```sql
SELECT aluno.nome, curso.nome 
FROM aluno, curso 
WHERE aluno.curso = curso.cursoId;
```

### Junção (JOIN)

```sql
SELECT aluno.nome, curso.nome 
FROM aluno 
INNER JOIN curso ON aluno.curso = curso.cursoId;
```

## 5. Exemplo Prático com MySQL
### Criação de Tabelas

```sql
CREATE TABLE curso (
    cursoId INT AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    PRIMARY KEY (cursoId),
    INDEX nomeCurso (nome ASC)
);

CREATE TABLE aluno (
    alunoId INT AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    curso INT,
    PRIMARY KEY (alunoId),
    INDEX nomeAluno (nome ASC),
    FOREIGN KEY (curso) REFERENCES curso(cursoId)
);
```
### Inserção de Dados

```sql
INSERT INTO curso (cursoId, nome) VALUES 
(1, 'Ciência da Computação'),
(2, 'Sistemas de Informação'),
(3, 'Jogos Digitais');

INSERT INTO aluno (alunoId, nome, curso) VALUES
(1000, 'Andrisa Santos', 1),
(1001, 'Gabriel Gonzalez', 1),
(1002, 'Matheus Rossatto', 2),
(1003, 'Iuri Lima', 3),
(1004, 'Gabriela Martins', 3),
(1005, 'Nadine Rosa', NULL);
```
### Consultas Comuns
- Listar alunos e seus cursos:
```sql
SELECT aluno.nome, curso.nome
FROM aluno, curso
WHERE aluno.curso = curso.cursoId;
```
- Alunos do curso "Ciência da Computação":
```sql
SELECT aluno.nome
FROM aluno, curso
WHERE curso.nome = 'Ciência da Computação' 
  AND curso.cursoId = aluno.curso;
```
- Quantidade de alunos no curso "Ciência da Computação":
```sql
SELECT COUNT(*)
FROM aluno, curso
WHERE curso.nome = 'Ciência da Computação' 
  AND curso.cursoId = aluno.curso;
```
