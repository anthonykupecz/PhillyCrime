with crime as (
    select 
        {{ dbt_utils.generate_surrogate_key(['dispatch_date', 'hour']) }} as date_key
        ,dispatch_date
        ,month
        ,day
        ,year
        ,day_name
        ,hour
        ,time_cat
    from {{ ref('stg_philly_crimes') }}
),

crime_row as (
    SELECT
        *
        ,ROW_NUMBER() OVER (PARTITION BY date_key ORDER BY date_key) as rn
    FROM crime
)

SELECT
    date_key
    ,dispatch_date
    ,month
    ,day
    ,year
    ,day_name
    ,hour
    ,time_cat
FROM 
    crime_row
WHERE
    rn = 1