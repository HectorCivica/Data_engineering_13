with 
-- Hay que coger source, porque en la silver de orders hemos cambiado la columna por el ID generado y no existe
source as (

select status from {{ source('sql_server_dbo', 'promos') }} 
),
dimension_status as (

    select distinct status,
    case 
        when status='active' then '1'
        when status='inactive' then '0'
        end as id_status,

    from stg_sql_server_dbo__promos

)

select * from dimension_status
