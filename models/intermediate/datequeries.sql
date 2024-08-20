#diviser les spoken languages diviser les productions countries diviser les genres diviser les productions company

SELECT 
imdb.imdb_id
, imdb.title
, imdb.original_title
, SPLIT(imdb.genres, ', ')[SAFE_OFFSET(0)] AS genre_1
, SPLIT(imdb.genres, ', ')[SAFE_OFFSET(1)] AS genre_2
, SPLIT(imdb.genres, ', ')[SAFE_OFFSET(2)] AS genre_3
, title.titleType
, imdb.release_date
, title.startYear
, imdb.runtime
, imdb.adult
, SPLIT(imdb.spoken_languages, ', ')[SAFE_OFFSET(0)] AS Language_1
, SPLIT(imdb.spoken_languages, ', ')[SAFE_OFFSET(1)] AS Language_2
, SPLIT(imdb.spoken_languages, ', ')[SAFE_OFFSET(2)] AS Language_3
, SPLIT(imdb.production_companies, ', ')[SAFE_OFFSET(0)] AS prod_comp_1
, SPLIT(imdb.production_companies, ', ')[SAFE_OFFSET(1)] AS prod_comp_2
, SPLIT(imdb.production_companies, ', ')[SAFE_OFFSET(2)] AS prod_comp_3
, SPLIT(imdb.production_countries, ', ')[SAFE_OFFSET(0)] AS prod_country_1
, SPLIT(imdb.production_countries, ', ')[SAFE_OFFSET(1)] AS prod_country_2
, SPLIT(imdb.production_countries, ', ')[SAFE_OFFSET(2)] AS prod_country_3
, imdb.budget
, imdb.revenue
, imdb.imdb_rating
, imdb.imdb_votes
 FROM {{ ref('stg_dbt-project-430308__imdb_join_long_films') }} as imdb
 LEFT JOIN  {{ ref('stg_dbt-project-430308__title') }} as title
 ON imdb.imdb_id = title.tconst
 WHERE title.titleType LIKE "movie"
 OR title.titleType LIKE "videoGame"
 AND runtime >= 75
 AND imdb_votes > 500
AND release_date > "1983-01-01" AND release_date < "2023-12-31"