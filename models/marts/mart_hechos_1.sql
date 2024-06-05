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

/*cte_products AS(
    SELECT *
    FROM {{ref('stg_sql_server_dbo__products')}}
),

cte_products_order_items AS(
    SELECT *
    FROM cte_order_items x
    join cte_products y
    on x.product_id=y.product_id
),
*/

renamed as (
    select created_at, a.order_id, b.product_id, promo_id, shipping_id, user_id,  id_status, address_id ,quantity, discount_dollar, shipping_cost, order_cost, order_total, order_cost+shipping_cost-discount_dollar as comprobacion
    from cte_orders a
    inner join cte_order_items b
    on a.order_id=b.order_id
    inner join cte_promos c
    on a.promo_id=c.id_promocion
    --join cte_products_order_items d
    --on a.order_id=d.order_id

)

select * from renamed
order by order_id