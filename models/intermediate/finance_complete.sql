SELECT
fi_inflation.imdb_id,
fi_inflation.title,
fi_inflation.budget_adjusted,
fi_inflation.box_office_adjusted,
fi_inflation.benefice_adjusted,
fi_inflation.roi,
fi_inflation.genre_1
FROM {{ ref('stg_dbt-project-430308__finance_inflation') }} AS fi_inflation
INNER JOIN {{ ref('datequeries') }} AS main
    ON fi_inflation.imdb_id = main.imdb_id
