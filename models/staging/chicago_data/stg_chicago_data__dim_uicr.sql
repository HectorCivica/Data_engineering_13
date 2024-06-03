with 

source as (

    select * from {{ source('chicago_data', 'dim_uicr') }}

),

renamed as (

    select
        iucr,
        primary_type,
        description

    from source

)

select * from renamed
