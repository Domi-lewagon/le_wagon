SELECT
imdb_id,
title,
runtime,
box_office,
budget,
CASE 
    WHEN (runtime) <80 THEN "short film"
    WHEN (runtime) <120 THEN "average_film"
    WHEN (runtime) <=160 THEN "long_film"
    WHEN (runtime) >160  THEN "extra long film"
END AS runtime_class

FROM {{ ref('finance') }}