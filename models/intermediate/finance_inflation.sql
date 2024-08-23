SELECT *
FROM {{ ref('finance') }} AS fi
LEFT JOIN {{ ref('stg_dbt-project-430308__cpi_inflation_year_index') }} AS CPI
ON fi.startYear=  CAST(CPI.year,int)