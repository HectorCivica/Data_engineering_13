{{
  config(
    materialized = "table",
  )
}}

with 

base as (

select shipping_service from {{ ref('base_sql_server_dbo__orders') }} 
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
    from base

)

select * from dimension_shipping