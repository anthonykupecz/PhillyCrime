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
        {{ dbt.safe_cast("objectid", api.Column.translate_type("integer")) }} as objectid,
        {{ dbt.safe_cast("park_name", api.Column.translate_type("string")) }} as park_name,
        {{ dbt.safe_cast("age_range", api.Column.translate_type("string")) }} as age_range,
        {{ get_playground_cat("age_range") }} as playground_cat,
        {{ dbt.safe_cast("lng", api.Column.translate_type("numeric")) }} as lng,
        {{ dbt.safe_cast("lat", api.Column.translate_type("numeric")) }} as lat,
        {{ dbt.safe_cast("zip", api.Column.translate_type("integer")) }} as zip

    from source

)

select * from playground