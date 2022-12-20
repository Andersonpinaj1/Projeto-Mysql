# --- ANÁLISE DE DADOS COM SQL --- #

-- Agrupamento
-- Filtragem em agrupamentos
-- Subqueries
-- Criação de Views


SELECT * FROM alugueis;
SELECT * FROM atores;
SELECT * FROM atuacoes;
SELECT * FROM clientes;
SELECT * FROM filmes;


# ======= CRIANDO AGRUPAMENTOS =======#

-- Fazendo uma análise para descobrir o preço médio de aluguel dos filmes.

SELECT AVG(preco_aluguel) FROM filmes;


-- Agora que eu sei o preço médio para se alugar um filme na hashtagmovies, agora vou ir além da análise e descobri qual e o preço médio para cada genoro de filme.

SELECT
	genero,
    ROUND(AVG(preco_aluguel), 2) AS preço_médio,
    COUNT(*) AS qtd_filmes
FROM filmes
GROUP BY genero;


# ======= FILTROS EM AGRUPAMENTOS =======#

-- Agora eu vou fazer uma análise, mas considerando apenas os filmes com ANO_LANCAMENTO igual a 2011.

SELECT
	genero,
    ROUND(AVG(preco_aluguel), 2) AS preço_médio,
    COUNT(*) AS qtd_filmes
FROM filmes
WHERE ano_lancamento = 2011
GROUP BY genero;


# =======  SUBQUERIES: UTILIZANDO UM SELECT DENTRO DE OUTRO SELECT   =======#

-- Agora vou fazer uma análise de desempenho dos alugueis. Para isso, uma análise comum é identificar quais aluguéis tiveram nota acima da média.

SELECT AVG(nota) FROM alugueis; 

SELECT
	*
FROM alugueis
WHERE nota >= (SELECT AVG(nota) FROM alugueis);


# =======  Criando Views - CREATE VIEW   =======#

-- Neste momento Criarei uma view para guardar o resultado do SELECT abaixo.

CREATE VIEW resultado AS
SELECT
	genero,
	ROUND(AVG(preco_aluguel), 2) AS media_preco,
    COUNT(*) AS qtd_filmes
FROM filmes
GROUP BY genero;

SELECT * FROM resultado;



