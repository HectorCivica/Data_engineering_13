{{
  config(
    materialized='table'
  )
}}



with 

source as (

    select * from {{ source('sql_server_dbo', 'promos') }}

),

renamed as (

    select
        md5(promo_id) as id_promocion,
        promo_id as promo_name,
        discount as discount_dollar,
        case 
        when status='active' then '1'
        when status='inactive' then '0'
        end as id_status,
        status,
        _fivetran_deleted,
        _fivetran_synced
    from source

)
,
added_row AS (
    SELECT 
        md5('No promotion') AS id_promocion,
        'No promotion' AS promo_name,
        0 AS discount_dollar,
        '0' as status_bool,
        'inactive' AS status,
        null AS _fivetran_deleted,
        CURRENT_TIMESTAMP AS _fivetran_synced
)

SELECT * FROM renamed
UNION ALL
SELECT * FROM added_row