/* 1) Retorne em uma só consulta os valores de média, máximo, mínimo, contagem e soma do campo “attendance” da tabela “schedules”, dataset “baseball”, mesmo que a contagem e a soma de torcedores nos estádios não tenham significado para análise de negócio. */

SELECT 
  AVG(attendance) as media,
  MAX(attendance) as val_maximo, 
  MIN(attendance) as val_min,
  count(attendance) as qtde_val
FROM bigquery-public-data.baseball.schedules;

/*2) No mesmo dataset e tabela do exercício anterior, retornar a quantidade de jogos 
disputados por cada time em casa por ano e também a soma de minutos jogados
em casa por ano. Ordenar de forma decrescente pelo ano e depois crescente 
pelo nome do time. */

SELECT
  COUNT(gameId) as qtde_jogos,
  SUM (duration_minutes) as soma_minutos,
  homeTeamName,
  year
FROM bigquery-public-data.baseball.schedules
WHERE status = "closed"
GROUP BY homeTeamName,year
ORDER BY year DESC, homeTeamName asc;

/*3) No dataset “austin_bikeshare”, descubra qual a quantidade de viagens 
realizadas em 2017 com duração de 30 minutos ou mais, somente de estações 
(tanto de partida quanto de chegada) que estão atualmente ativas.*/

SELECT 
  count(t.trip_id) as qtde_viagens,
  format_date("%Y",t.start_time) as ano
FROM bigquery-public-data.austin_bikeshare.bikeshare_trips as t
JOIN bigquery-public-data.austin_bikeshare.bikeshare_stations as si ON t.start_station_id = si.station_id
JOIN bigquery-public-data.austin_bikeshare.bikeshare_stations as se ON t.start_station_id = se.station_id
WHERE 
  t.duration_minutes >= 30 
  AND extract(year from t.start_time) = 2017 
  AND si.status ="active" 
  AND se.status ="active" 
GROUP BY ano;

/*4) No mesmo dataset anterior, calcule a média de duração das viagens por tipo de 
cliente (“subscriber_type”) por ano.*/

SELECT
  round(AVG(duration_minutes),1),
  subscriber_type,
  format_date("%Y", start_time) as ano
FROM bigquery-public-data.austin_bikeshare.bikeshare_trips
GROUP BY subscriber_type, ano
ORDER BY ano ASC;