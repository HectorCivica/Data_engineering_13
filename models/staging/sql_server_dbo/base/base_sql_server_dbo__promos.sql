{{
  config(
    materialized='view'
  )
}}



with 

source as (

    select * from {{ source('sql_server_dbo', 'promos') }}

),

renamed as (

    select
        *
    from source

)


SELECT * FROM renamed
