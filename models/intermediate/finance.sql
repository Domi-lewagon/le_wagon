SELECT 
imdb_id,
title,
budget,
revenue,
imdb_votes,
release_date,
startYear,
runtime,
genre_1,
genre_2,
genre_3,
prod_comp_1,
prod_comp_2,
prod_comp_3,
prod_country_1,
prod_country_2,
prod_country_3,
FROM {{ ref('datequeries') }}
WHERE revenue > 1000000
    AND
    budget> 100
    AND
    imdb_votes > 10000
ORDER BY budget DESC
