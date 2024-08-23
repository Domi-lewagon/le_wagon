with 

source as (

    select * from {{ source('dbt-project-430308', 'cpi_inflation_year_index') }}

),

renamed as (

    select
        year,
        cpi

    from source

)

select * from renamed
