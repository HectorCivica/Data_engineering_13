{{ config(
    materialized='table',
    on_schema_change='fail'
    ) 
}}

WITH cte_hechos AS (
    SELECT * 
    FROM {{ ref('inter_hechos_1') }}
    )

select created_at,
order_id,
product_id,
promo_id,
shipping_id,
user_id,
quantity,
descuento_por_producto_distino,
coste_envio_por_producto_distinto,
coste_pedido_por_producto_distinto,
coste_total_por_producto_distinto
 from cte_hechos