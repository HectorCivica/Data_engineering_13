with 

source as (

select shipping_service from {{ source('sql_server_dbo', 'orders') }} 
),

dimension_shipping as (

    select distinct case when shipping_service=''
            then md5('No shipping')
            else md5(shipping_service)
            end as shipping_id,
        case when shipping_service=''
            then 'No shipping'
            else shipping_service
            end as shipping_desc
    from source

)

select * from dimension_shipping