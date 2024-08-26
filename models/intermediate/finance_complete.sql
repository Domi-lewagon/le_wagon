SELECT
fi_inflation.imdb_id,
fi_inflation.title,
director.directors,
fi_inflation.budget,
fi_inflation.budget_adjusted,
fi_inflation.box_office,
fi_inflation.box_office_adjusted,
fi_inflation.benefice,
fi_inflation.benefice_adjusted,
fi_inflation.roi,
fi_inflation.genre_1,
fi_inflation.startYear,
main.Language_1
FROM {{ ref('stg_dbt-project-430308__finance_inflation') }} AS fi_inflation
INNER JOIN {{ ref('datequeries') }} AS main
    ON fi_inflation.imdb_id = main.imdb_id
INNER JOIN {{ ref('stg_dbt-project-430308__with_directors_copy') }} AS director
    ON fi_inflation.imdb_id= director.imdb_id
