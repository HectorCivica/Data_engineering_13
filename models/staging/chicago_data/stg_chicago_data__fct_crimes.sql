with 

source as (

    select * from {{ source('chicago_data', 'fct_crimes') }}

),

renamed as (

    select
        id,
        case_number,
        date,
        block,
        iucr,
        id_location,
        arrest,
        domestic,
        beat,
        district,
        ward,
        community_area,
        fbi_code,
        x_coordinate,
        y_coordinate,
        updated_on,
        latitude,
        longitude,
        location

    from source

)

select * from renamed
