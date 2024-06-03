with 

source as (

    select * from {{ source('chicago_data', 'crimes') }}

),

renamed as (

    select
        id,
        case_number,
        date,
        block,
        iucr,
        primary_type,
        description,
        location_description,
        arrest,
        domestic,
        beat,
        district,
        ward,
        community_area,
        fbi_code,
        x_coordinate,
        y_coordinate,
        year,
        updated_on,
        latitude,
        longitude,
        location

    from source

)

select * from renamed
