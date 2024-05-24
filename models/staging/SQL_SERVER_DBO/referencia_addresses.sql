with 

source as (

    select * from {{ ref('stg_SQL_SERVER_DBO__ADDRESSES') }}

),

renamed as (

    select
        address_id,
        zipcode,
        country,
        address,
        state as pais,
        _fivetran_deleted,
        _fivetran_synced

    from source

)

select * from renamed
