{{
    config(
        materialized='table'
    )
}}

-- Query to add playground category to the table

with 

source as (

    select * from {{ source('stg', 'playground') }}

),

playground as (

    select
        objectid,
        park_name,
        age_range,
        {{ get_playground_cat("age_range") }} as playground_cat,
        lng,
        lat,
        zip

    from source

)

select * from playground