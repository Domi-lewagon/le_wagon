--First with, to get sum of all rows
WITH total AS (
  SELECT 
    COUNT(imdb_id) AS total_movies
  FROM {{ ref('datequeries') }}
),
-- This intermediate for extract year count all rows and get percent 
intermediate_date AS (SELECT
  EXTRACT(year FROM release_date) AS year,
  COUNT(imdb_id) AS nb_movies,
  ROUND(SAFE_DIVIDE(COUNT(imdb_id), MAX(total.total_movies)) * 100,3) AS Percent_total,
  genre_1
FROM {{ ref('datequeries') }}
CROSS JOIN total
GROUP BY year,genre_1
ORDER BY year
)
-- Get year, genre count and create a new column case when for segment all count
SELECT
year,
CASE 
    WHEN year BETWEEN 1980 AND 1989 THEN '1980'
    WHEN year BETWEEN 1990 AND 1999 THEN '1990'
    WHEN year BETWEEN 2000 AND 2009 THEN '2000'
    WHEN year BETWEEN 2010 AND 2019 THEN '2010'
    WHEN year >= 2020 THEN '2020'
    ELSE 'Unknown'
END AS Decades,
genre_1,
nb_movies,
Percent_total
FROM intermediate_date
GROUP BY year,Decades,genre_1,nb_movies,Percent_total
ORDER BY year
-------------------------------------------------------------------------------------------------