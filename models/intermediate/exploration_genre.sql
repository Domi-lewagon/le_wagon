--Query for have each movie per year
WITH total AS (
  SELECT 
    COUNT(imdb_id) AS total_movies
  FROM {{ ref('datequeries') }}
)

-- This intermediate for extract year count all rows and get percent 
SELECT
  genre_1,
  COUNT(imdb_id) AS nb_movies,
  ROUND(SAFE_DIVIDE(COUNT(imdb_id), MAX(total.total_movies)) * 100,2) AS Percent,
FROM {{ ref('datequeries') }}
CROSS JOIN total
GROUP BY genre_1
ORDER BY nb_movies DESC
------------------------------------------------------------------------------------------------