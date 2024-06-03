{{
  config(
    materialized = "table",
  )
}}

with 

source as (

    select * from {{ source('sql_server_dbo', 'products') }}

),

renamed as (

    select
        product_id,
        price,
        name,
        inventory,
        _fivetran_deleted,
        _fivetran_synced

    from source

)

,
added_row AS (
    SELECT 
        md5('empty_product') as product_id,
        0 as price,
        'empty_product' as name,
        0 as inventory,
        null as _fivetran_deleted,
        CURRENT_TIMESTAMP AS _fivetran_synced
)

SELECT * FROM renamed
UNION ALL
SELECT * FROM added_row
