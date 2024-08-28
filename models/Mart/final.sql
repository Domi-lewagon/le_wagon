SELECT d.*,
fu.roi,
fu.directors,
fu.budget_adjusted,
fu.box_office_adjusted,
fu.benefice_adjusted,
te.Decades,
ar.runtime_class
FROM {{ ref('datequeries') }} as d 
LEFT JOIN {{ ref('finance_complete') }} fc 
USING (imdb_id)
LEFT JOIN {{ ref('time_exploration') }} as te 
USING (imdb_id)
LEFT JOIN {{ ref('average_runtime') }} as ar 
USING (imdb_id)
LEFT JOIN {{ ref('stg_dbt-project-430308__finance_ultime') }} as fu 
USING(imdb_id)