with 

source as (

    select * from {{ source('dbt-project-430308', 'with_directors_copy') }}

),

renamed as (

    select
        imdb_id,
        title,
        release_date,
        startyear,
        runtime,
        budget,
        revenue,
        imdb_rating,
        imdb_votes,
        production_company,
        spoken_language,
        genres_unique,
        directors

    from source

)

select * from renamed
