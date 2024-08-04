/* 1) Ache a tabela “users” no dataset “thelook_ecommerce”, no projeto de dados públicos do BigQuery. Traga como resultado um único campo distinto com as informações de forma organizada dos campos street_address + city + state +country + postal_code. */

SELECT DISTINCT
  concat(street_address, ", ", city, ", ", state, " - ", country, ", ", postal_code) as endereco
FROM bigquery-public-data.thelook_ecommerce.users;

/*2) Ache a tabela “top_terms” no dataset “google_trends”, e descubra os termos, suas posições no rank e áreas de pesquisa para os termos começados com “N” no dia 2023-04-30. Obs.: não se esqueça de colocar essa restrição de data no where, pois a tabela é grande e particionada (processa somente a data que você colocar). Ordene por rank.*/

SELECT 
  term as termo, 
  rank as ranking,
  dma_name as area_pesquisa,
  week
FROM bigquery-public-data.google_trends.top_terms
WHERE date(week) = '2023-04-30' AND STARTS_WITH(term, "N") 
ORDER BY ranking;

/* 3) Ache a tabela “stations” do dataset “new_york_subway” e substitua no campo “station_name”, a palavra “St” por “Street” nos casos em que o final do nome da estação termine em “St” e “Av” por “Avenue” nos casos em que o final do nome da estação termine em “Av”. Traga como resultado somente o campo “station_name” de forma distinta e restringindo apenas as linhas que tenham “St” ou “Av” no nome. */

SELECT DISTINCT
  REPLACE (replace(station_name, "Av", "Avenue"), "St", "Street"),
FROM bigquery-public-data.new_york_subway.stations
WHERE UPPER(station_name) LIKE "%ST" or LOWER(station_name) LIKE "%av";

select distinct
  case
    when station_name like "%St" then replace(station_name, "St", "Street")
    when station_name like "%Av" then replace(station_name, "Av", "Avenue")
  end as station_name
from bigquery-public-data.new_york_subway.stations
where station_name like "%St" or station_name like '%Av';

/*4) [DESAFIO] No mesmo dataset do item anterior e tabela “stop_times”, extraia somente o nome do dia da semana do campo “trip_id”, considerando somente sábado e domingo como resposta (utilize como restrição no where, usando lower e upper também). Traga também o “trip_id” no select.*/

select distinct
  trip_id,
  case 
    when split(trip_id, "-")[ordinal(3)] = 'SI017' then split(trip_id, "-")[ordinal(4)]
    else split(trip_id, "-")[ordinal(3)] 
  end as dia
from bigquery-public-data.new_york_subway.stop_times
where lower(trip_id) like '%sunday%' or UPPER(trip_id) like '%SATURDAY%';


