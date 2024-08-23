with 

source as (

    select * from {{ source('dbt-project-430308', 'cpi_inflation_year_index') }}

),

renamed as (

    select
         CAST(year AS int) AS year,
        cpi

    from source

)

select * from renamed
