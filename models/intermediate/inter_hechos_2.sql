{{ config(
    materialized='view',
    on_schema_change='fail'
    ) 
}}

WITH cte_events AS (
    SELECT * 
    FROM {{ ref('stg_sql_server_dbo__events') }}
    )

select * from cte_events