{{ config(
    materialized='view',
    on_schema_change='fail'
    ) 
}}

WITH cte_interesante AS (
    SELECT * 
    FROM {{ ref('inter_hechos_1') }}
    )

select distinct(order_id), descuento, shipping_cost, order_cost, order_total from cte_interesante
