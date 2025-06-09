with 

source as (

    select * from {{ source('stg', 'phillycrimes') }}

),

renamed as (

    select
        unique_row_id,
        filename,
        objectid,
        dc_dist,
        dispatch_date,
        hour,
        location_block,
        text_general_code,
        ucr_general,
        lat,
        lng,
        zip,
        {{ get_crime_level("ucr_general") }} as crime_level,


    from source

)

select * from renamed
