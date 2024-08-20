
--Les premières requêtes pour avoir premiers insight
WITH total AS (
  SELECT 
    COUNT(imdb_id) AS total_movies
  FROM {{ ref('datequeries') }}
),

intermediate_date AS (SELECT
  EXTRACT(year FROM release_date) AS year,
  COUNT(imdb_id) AS nb_movies,
  ROUND(SAFE_DIVIDE(COUNT(imdb_id), MAX(total.total_movies)) * 100,2) AS Percent,
  genre_1,
  AVG(imdb_rating) AS avg_rate
FROM {{ ref('datequeries') }}
CROSS JOIN total
GROUP BY year,genre_1
ORDER BY avg_rate DESC
)

-- creer un case when par decennie
SELECT
year,
COUNT(*) AS Movie_Count,

CASE 
    WHEN year < 1980 THEN 'Pre-80s'
    WHEN year BETWEEN 1980 AND 1989 THEN '80s'
    WHEN year BETWEEN 1990 AND 1999 THEN '90s'
    WHEN year BETWEEN 2000 AND 2009 THEN '2000s'
    WHEN year BETWEEN 2010 AND 2019 THEN '2010s'
    WHEN year >= 2020 THEN '2020s'
    ELSE 'Unknown'
END AS Decades
FROM intermediate_date
GROUP BY Decades, year
ORDER BY year
