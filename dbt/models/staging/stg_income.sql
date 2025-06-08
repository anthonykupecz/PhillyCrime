with 

source as (

    select * from {{ source('staging', 'income') }}

),

renamed as (

    select
        zip,
        income

    from source

)

select * from renamed
