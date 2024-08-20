SELECT extract(year FROM release_date) AS year
,COUNT(*) AS nb_movies
FROM {{ ref('datequeries') }}
GROUP BY release_date
ORDER BY release_date