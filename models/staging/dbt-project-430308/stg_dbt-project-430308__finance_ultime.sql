with 

source as (

    select * from {{ source('dbt-project-430308', 'finance_ultime') }}

),

renamed as (

    select
        imdb_id,
        title,
        directors,
        budget,
        budget_adjusted,
        box_office,
        box_office_adjusted,
        benefice,
        benefice_adjusted,
        roi,
        imdb_rating,
        imdb_votes,
        release_date,
        startyear,
        runtime,
        genre_1

    from source

)

select * from renamed
