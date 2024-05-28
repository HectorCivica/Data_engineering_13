with 

source as (

    select * from {{ source('sql_server_dbo', 'orders') }}

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

    from source

)

select * from renamed
