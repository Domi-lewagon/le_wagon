WITH finance_cip_join AS(
SELECT *
FROM {{ ref('finance') }} AS fi
INNER JOIN {{ ref('stg_dbt-project-430308__cpi_inflation_year_index') }} AS CPI
    ON fi.startYear = CPI.year)

SELECT
imdb_id,
title,
budget,
box_office,
benefice,
ROI,
imdb_rating,
imdb_votes,
release_date,
startYear,
runtime,
genre_1,
FROM finance_cip_join