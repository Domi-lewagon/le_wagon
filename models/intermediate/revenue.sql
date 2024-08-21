SELECT 
imdb_id,
title,
budget,
revenue,
FROM {{ ref('datequeries') }}
WHERE revenue > 0
    AND
       budget between 10 AND 1000000
ORDER BY budget
