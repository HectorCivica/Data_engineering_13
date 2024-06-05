{{
  config(
    materialized='table'
  )
}}



with 

source as (

    select * from {{ ref('stg_sql_server_dbo__promos') }}

)

select * from source