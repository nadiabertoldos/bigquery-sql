/*1) Procure o dataset “thelook_ecommerce”. Calcule o tempo em dias da data de cadastro até a última compra de cada usuário*/
SELECT 
  u.id,
  max(timestamp_diff(o.created_at, u.created_at,day)) as diferenca
FROM bigquery-public-data.thelook_ecommerce.users u 
JOIN bigquery-public-data.thelook_ecommerce.orders o ON u.id = o.user_id
GROUP BY 1
ORDER BY 2 ASC;

/*2) Na mesma tabela, calcule o tempo em dias entre a primeira e a última compra de cada usuário*/

SELECT 
  user_id,
  timestamp_diff(max(created_at), min(created_at),day) as diferenca
FROM bigquery-public-data.thelook_ecommerce.orders
GROUP BY 1
ORDER BY 2 DESC; 

/*3) No mesmo dataset, e tabela de eventos, traga a quantidade de registros para cada usuário entre 06 de maio de 2023 menos 73 dias e 09 de maio de 2023, nos eventos de carrinho e compra. Ordene por usuário e tipo do evento.*/


SELECT 
  user_id as ID,
  count(event_type) as quantidade_registro
FROM bigquery-public-data.thelook_ecommerce.events
WHERE (date(created_at) between date_sub('2023-05-06', interval 73 day) and '2023-05-09') AND event_type IN ('cart', 'purchase')
AND user_id is not null
GROUP BY user_id, event_type
ORDER BY user_id, event_type DESC; 

/*4) Ache o dataset “catalonian_mobile_coverage” e calcule a quantidade de sinais 4G recebidos no mês de março de 2016*/
SELECT 
  count(net) as qtde_4G
FROM bigquery-public-data.catalonian_mobile_coverage.mobile_data_2015_2017
WHERE net = "4G" and format_date('%Y-%m', date) = '2016-03';


