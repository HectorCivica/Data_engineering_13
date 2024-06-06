{{ config(
    materialized='view',
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

cte_products AS(
    SELECT *
    FROM {{ref('stg_sql_server_dbo__products')}}
),
/*
cte_products_order_items AS(
    SELECT *
    FROM cte_order_items x
    join cte_products y
    on x.product_id=y.product_id
),
*/

cte_orders_order_items_promos as (
    select created_at, a.order_id, b.product_id, promo_id, shipping_id, user_id,  id_status, address_id ,quantity, discount_dollar, shipping_cost, order_cost, order_total, order_cost+shipping_cost-discount_dollar as comprobacion
    from cte_orders a
    join cte_order_items b
    on a.order_id=b.order_id
    left join cte_promos c -- Hay que hacer un left join porque habia orders que no aparecian. Algunos no tienen promocion y hay que castear un poco
    on a.promo_id=c.id_promocion
    --join cte_products_order_items d
    --on a.order_id=d.order_id

)

select created_at, 
a.order_id, 
b.product_id,
name as nombre_producto,
count(*) over (partition by a.order_id) as numero_de_productos_distintos,
price,
promo_id, shipping_id, user_id,
--id_status, address_id,
quantity, 
case when discount_dollar is null
then 0
else discount_dollar
end as descuento, 
round(descuento/numero_de_productos_distintos,3) as descuento_por_producto_distino,
shipping_cost,
round(shipping_cost/numero_de_productos_distintos,3) as coste_envio_por_producto_distinto,
order_cost,
price*quantity as coste_pedido_por_producto_distinto,
order_total,
round(order_total/numero_de_productos_distintos,3) as coste_total_por_producto_distinto, 
order_cost+shipping_cost-descuento as comprobacion_total,
--coste_envio_por_producto+coste_pedido_por_producto-descuento_por_producto as comprobacion_por_producto
from cte_orders_order_items_promos A
join cte_products B
on A.product_id=B.product_id
order by order_id

--select * from cte_orders_order_items_promos
--order by order_id
