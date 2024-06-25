/*
Exercicio criação de database e tabelas relacionadas

- criar um DB chamado Filmes

- criar uma table para definir os campos que armazenarão dados sobre os filmes
 exemplo: id, nome, elenco principal, diretor, roteirista, data de lançamento (COLUNAS)

- criar outra table para armazenar dados sobre a produtora do filme
	exemplo: id, nome da produtora, orçamento do filme, nome dos produtores (COLUNAS)

trabalhar com o relacionamento entre essas duas tabelas - uma será a tabela principal (tabela-pai)
e a outra será a tabela dependente (relação pai-filho entre tables)

- inserir dados nas tables seguindo os respectivos campos que os armazenarão

- consultar os dados de cada table (todos os dados)

- consultar um unico dado de cada table usando a clausula WHERE
*/

-------- CRIANDO A DB Filme --------
CREATE DATABASE Filme_Corrigido


-------- CRIANDO TABLE --------
CREATE TABLE DadosProdutora
(
    DadosProdutora_id INT NOT NULL IDENTITY(1, 1),
    NomeProdutora VARCHAR(50),
    Orcamento MONEY,
    NomeProdutores VARCHAR(50),
    CONSTRAINT pk_DadosProdutora PRIMARY KEY(DadosProdutora_id)
)

-------- CRIANDO TABLE --------
CREATE TABLE DadosFilme
(
    DadosFilme_id INT NOT NULL IDENTITY(1, 1),
    Nome VARCHAR(50),
    ElencoPrincipal VARCHAR(50),
    Diretor VARCHAR(50),
    Roteirista VARCHAR(50),
    DataLancamento DATE,
    DadosProdutora_id INT NOT NULL,
    CONSTRAINT pk_DadosFilme PRIMARY KEY(DadosFilme_id),
    CONSTRAINT fk_DadosProdutora FOREIGN KEY(DadosProdutora_id) REFERENCES DadosProdutora(DadosProdutora_id)
)

-------- POPULANDO TABLE --------
INSERT INTO DadosProdutora (NomeProdutora, Orcamento, NomeProdutores)
VALUES
('Castle Rock Entertainment', 25000000, 'Frank Darabont, Liz Glotzer, David Lester'),
('Warner Bros. Pictures', 160000000, 'Christopher Nolan, Emma Thomas'),
('Legendary Pictures, DC Comics', 185000000, 'Emma Thomas, Charles Roven'),
('Miramax Films', 8000000, 'Lawrence Bender'),
('Paramount Pictures', 55000000, 'Wendy Finerman, Steve Tisch')


-------- POPULANDO TABLE --------
INSERT INTO DadosFilme (Nome, ElencoPrincipal, Diretor, Roteirista, DataLancamento, DadosProdutora_id)
VALUES
('Um Sonho de Liberdade', 'Tim Robbins, Morgan Freeman', 'Frank Darabont', 'Frank Darabont', '1994-10-14', 1),
('A Origem', 'Leonardo DiCaprio', 'Christopher Nolan', 'Christopher Nolan', '2010-07-16', 2),
('O Cavaleiro das Trevas', 'Christian Bale', 'Christopher Nolan', 'Jonathan Nolan', '2008-06-18', 2),
('Tempo de Violência', 'John Travolta', 'Quentin Tarantino', 'Quentin Tarantino', '1994-10-14', 4),
('Forrest Gump', 'Tom Hanks', 'Robert Zemeckis', 'Eric Roth', '1994-06-06', 5)

-------- CONSULTANDO TABLE's --------
SELECT * FROM DadosProdutora
SELECT * FROM DadosFilme

-------- CONSULTANDO UM DADO DAS TABLE's --------
SELECT * FROM DadosProdutora WHERE DadosProdutora_id = 1
SELECT * FROM DadosFilme WHERE DadosFilme_id = 1


-------- JOIN JUNTANDO TABLE DE PRODUTORA E FILME --------

SELECT
	DadosProdutora.DadosProdutora_id , NomeProdutora, Orcamento, NomeProdutores, Nome, ElencoPrincipal, Diretor, Roteirista, DataLancamento
FROM
	DadosProdutora, DadosFilme
WHERE
	DadosProdutora.DadosProdutora_id = DadosFilme.DadosProdutora_id


-------- JOIN PROCURANDO ID DO FILME --------

SELECT
	DadosFilme_id, Nome, ElencoPrincipal, Diretor, Roteirista, DataLancamento, DadosProdutora.DadosProdutora_id , NomeProdutora, Orcamento, NomeProdutores
FROM
	DadosProdutora, DadosFilme
WHERE
	DadosProdutora.DadosProdutora_id = DadosFilme.DadosProdutora_id AND DadosFilme_id = 3
