{{
  config(
    materialized = "table",
  )
}}

with 

base as (

    select * from {{ ref('base_sql_server_dbo__orders') }}

),

renamed as (

    select
        order_id,
        case when shipping_service=''
            then md5('No shipping')
            else md5(shipping_service)
            end as shipping_id,
        case when shipping_service=''
            then 'No shipping'
            else shipping_service
            end as shipping_desc,
        shipping_cost,
        address_id,
        created_at,
            case when promo_id=''
            then md5('No promo')
            else md5(promo_id)
            end as promo_id,
        case when promo_id=''
            then 'No promo'
            else promo_id
            end as promo_name,
        estimated_delivery_at,
        order_cost,
        user_id,
        order_total,
        delivered_at,
        tracking_id,
        status,
        _fivetran_deleted,
        _fivetran_synced

    from base

)
--select * from renamed

,
added_row AS (
    SELECT 
        md5('empty_order') as order_id,
        md5('No shipping') as shipping_id,
        'No shipping' as shipping_desc,
        0 as shipping_cost,
        null as address_id,
        null as created_at,
        null as promo_id,
        null as promo_name,
        null as estimated_delivery_at,
        null as order_cost,
        null as user_id,
        null as order_total,
        null as delivered_at,
        null as tracking_id,
        null as status,
        null as _fivetran_deleted,
        null as _fivetran_synced

)

SELECT * FROM renamed
UNION ALL
SELECT * FROM added_row