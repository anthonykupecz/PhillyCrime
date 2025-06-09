with crime as (
    select 
        unique_row_id
        ,{{ dbt_utils.generate_surrogate_key(['dispatch_date', 'hour']) }} as date_key
        ,{{ dbt_utils.generate_surrogate_key(['lat', 'lng', 'dc_dist']) }} as loc_key
        ,ucr_general

    from {{ ref('stg_philly_crimes') }}
)


SELECT 
    *
FROM 
    crime
