/* 1) [DESAFIO] Ache o conjunto de dados público do BigQuery “san_francisco_trees”, tabela “street_trees”. Essa tabela traz informações de várias árvores na cidade de São Francisco, nos EUA. Retorne uma amostra de 100 árvores, sendo 50 da espécie “Persea americana” e 50 da espécie “Magnolia grandiflora”. Precisa retornar essas amostras na MESMA consulta. Pesquise como fazer isso.DICA: pesquisar sobre WITH e sobre UNION ALL (esses dois comandos também serão explicados mais pra frente, já é uma antecipação de conhecimento).*/


WITH 
  persea AS 
  (SELECT species from bigquery-public-data.san_francisco_trees.street_trees WHERE species LIKE "Persea americana%" LIMIT 50),
  magnolia AS
  (SELECT species from bigquery-public-data.san_francisco_trees.street_trees WHERE species LIKE "Magnolia grandiflora%" LIMIT 50)

SELECT * FROM persea
UNION ALL
SELECT * FROM magnolia
ORDER BY species;


/*With ClientesAtivos AS
(
        SELECT Id from Client WHERE IsActive = 1
),
ClientesInativos AS -- apenas um WITH, os demais são separados por vírgula)
(
        SELECT Id from Client WHERE IsActive = 0
)
SELECT * FROM ClientesAtivos
UNION ALL
SELECT * FROM ClientesInativos*/

