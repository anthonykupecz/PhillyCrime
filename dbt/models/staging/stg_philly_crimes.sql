{{
    config(
        materialized='table'
    )
}}

-- Query to add crime category to table

with 

source as (

    select * from {{ source('stg', 'phillycrimes') }}

),

phillycrimes as (

    select
        unique_row_id,
        {{ dbt.safe_cast("filename", api.Column.translate_type("string")) }} as filename,
        {{ dbt.safe_cast("objectid", api.Column.translate_type("integer")) }} as objectid,
        {{ dbt.safe_cast("dc_dist", api.Column.translate_type("integer")) }} as dc_dist,
        {{ dbt.safe_cast("dispatch_date", api.Column.translate_type("date")) }} as dispatch_date,
        EXTRACT(MONTH FROM dispatch_date) as month,
        EXTRACT(DAY FROM dispatch_date) as day,
        EXTRACT(YEAR FROM dispatch_date) as year,
        FORMAT_DATE('%A', dispatch_date) as day_name,
        {{ dbt.safe_cast("hour", api.Column.translate_type("integer")) }} as hour,
        {{ get_time_cat("hour")}} as time_cat,
        {{ dbt.safe_cast("location_block", api.Column.translate_type("string")) }} as location_block,
        {{ dbt.safe_cast("text_general_code", api.Column.translate_type("string")) }} as text_general_code,
        {{ dbt.safe_cast("ucr_general", api.Column.translate_type("integer")) }} as ucr_general,
        {{ get_crime_level("ucr_general") }} as crime_level,
        {{ dbt.safe_cast("lat", api.Column.translate_type("numeric")) }} as lat,
        {{ dbt.safe_cast("lng", api.Column.translate_type("numeric")) }} as lng,
        {{ dbt.safe_cast("zip", api.Column.translate_type("integer")) }} as zip

    from source

)

select * from phillycrimes
