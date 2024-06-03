with 

source as (

    select * from {{ source('chicago_data', 'dim_location') }}

),

renamed as (

    select
        id_location,
        location_description

    from source

)

select * from renamed
