SELECT
imdb_id,
title,
runtime,
CASE 
    WHEN (runtime) <80 THEN "short film"
    WHEN (runtime) BETWEEN 80 AND 120 THEN "averave"
    WHEN (runtime) BETWEEN 120 AND 160 THEN "long film"
    WHEN (runtime) >160  THEN "extra long film"
END AS runtime_class

FROM {{ ref('finance') }}