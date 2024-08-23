with 

source as (

    select * from {{ source('dbt-project-430308', 'director_analysis_5films') }}

),

renamed as (

    select
        directors,
        nb_film,
        avg_rating,
        avg_votes,
        avg_budget,
        avg_revenue,
        avg_runtime

    from source

)

select * from renamed
