SELECT
imdb_id,
title,
runtime,
CASE 
    WHEN (runtime) <80 THEN "short film"
    WHEN (runtime) BETWEEN 80 AND 90 THEN "80-90"
    WHEN (runtime) BETWEEN 90 AND 100 THEN "90-100"
    WHEN (runtime) BETWEEN 100 AND 110 THEN "100-110"
    WHEN (runtime) BETWEEN 110 AND 120 THEN "110-120"
    WHEN (runtime) BETWEEN 120 AND 130 THEN "120-130"
    WHEN (runtime) BETWEEN 130 AND 140 THEN "130-140"
    WHEN (runtime) BETWEEN 140 AND 150 THEN "140-150"
    WHEN (runtime) BETWEEN 150 AND 160 THEN "150-160"
    WHEN (runtime) >160  THEN "extra long film"
END AS runtime_class

FROM {{ ref('finance') }}