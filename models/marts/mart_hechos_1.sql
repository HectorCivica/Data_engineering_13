{{ config(
    materialized='table',
    on_schema_change='fail'
    ) 
}}

WITH cte_orders AS (
    SELECT * 
    FROM {{ ref('stg_sql_server_dbo__orders') }}
    ),

cte_order_items AS(
    SELECT *
    FROM {{ref('stg_sql_server_dbo__order_items')}}
),

cte_promos AS(
    SELECT *
    FROM {{ref('stg_sql_server_dbo__promos')}}
),

renamed as (
    select a.order_id, product_id, promo_id, shipping_id, user_id,  id_status, address_id ,quantity, discount_dollar, shipping_cost, order_cost, order_total
    from cte_orders a
    inner join cte_order_items b
    on a.order_id=b.order_id
    inner join cte_promos c
    on a.promo_id=c.id_promocion
)

select * from renamed