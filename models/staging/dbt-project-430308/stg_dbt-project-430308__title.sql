with 

source as (

    select * from {{ source('dbt-project-430308', 'title') }}

),

renamed as (

    select
        tconst,
        titletype,
        primarytitle,
        originaltitle,
        isadult,
        startyear,
        endyear,
        runtimeminutes,
        genres

    from source

)

select * from renamed
