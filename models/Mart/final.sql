SELECT d.*,
fc.ROI,
fc.directors,
budget_adjusted,
box_office_adjusted,
benefice_adjusted,
FROM {{ ref('datequeries') }} as d 
LEFT JOIN {{ ref('finance_complete') }} fc 
USING (imdb_id)