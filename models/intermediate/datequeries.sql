select*
from {{ ref('stg_dbt-project-430308__imdb_join_long_films') }}