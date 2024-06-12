{{
  config(
    materialized = "table",
  )
}}

with 
-- Hay que coger source, porque en la silver de orders hemos cambiado la columna por el ID generado y no existe
source as (

select status from {{ ref('base_sql_server_dbo__promos') }} 
),
dimension_status as (

    select distinct status,
    case 
        when status='active' then '1'
        when status='inactive' then '0'
        end as id_status,

    from source

)

select * from dimension_status
