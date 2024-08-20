with 

source as (

    select * from {{ source('dbt-project-430308', 'imdb_join_long_films') }}

),

renamed as (

    select
        imdb_id,
        title,
        original_title,
        genres,
        production_companies,
        production_countries,
        release_date,
        runtime,
        budget,
        revenue,
        vote_average,
        vote_count,
        popularity,
        imdb_rating,
        imdb_votes,
        spoken_languages,
        adult

    from source

)

select * from renamed
