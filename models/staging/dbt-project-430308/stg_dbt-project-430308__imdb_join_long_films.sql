with 

source as (

    select * from {{ source('dbt-project-430308', 'imdb_join_long_films') }}

),

renamed as (

    select

    from source

)

select * from renamed
