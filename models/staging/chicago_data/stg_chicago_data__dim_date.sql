with 

source as (

    select * from {{ source('chicago_data', 'dim_date') }}

),

renamed as (

    select
        date,
        year,
        month,
        month_name,
        day,
        number_week_day,
        week_day,
        quarter

    from source

)

select * from renamed
