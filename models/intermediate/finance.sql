SELECT 
imdb_id,
title,
budget,
revenue AS box_office,
ROUND((revenue - budget),2) AS benefice,
ROUND(((revenue-budget))/(budget),2) AS ROI,
imdb_rating,
imdb_votes,
release_date,
cast(startYear AS integer) as startYear,
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
ORDER BY ROI DESC
