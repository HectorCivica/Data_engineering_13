{{
  config(
    materialized = "table",

  )
}}

-- models/dim_time.sql
with recursive dates as (
    select 
        date('{{ var("start_date", "2000-01-01") }}') as date_day

    union all

    select 
        date_day + interval '1 day'
    from dates
    where date_day + interval '1 day' <= date('{{ var("end_date", "2025-12-31") }}')
)

select
    date_day as date,
    extract(year from date_day) as year,
    extract(month from date_day) as month,
    extract(day from date_day) as day,
    extract(dayofweek from date_day) as day_of_week,
    extract(week from date_day) as week,
    extract(dayofyear from date_day) as day_of_year,
    extract(quarter from date_day) as quarter,
    case 
        when extract(dayofweek from date_day) in (1, 7) then 'weekend'
        else 'weekday'
    end as weekend_or_weekday,
    -- Agrega otras columnas que necesites
from dates
