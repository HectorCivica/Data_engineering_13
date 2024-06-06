{{
  config(
    materialized = "view",
  )
}}

with 

source as (

    select * from {{ source('sql_server_dbo', 'orders') }}

)


select * from source