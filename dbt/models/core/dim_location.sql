with loc as (
    select 
         {{ dbt_utils.generate_surrogate_key(['lat', 'lng']) }} as loc_key
         ,lat
         ,lng
         ,zip
    from {{ ref('stg_philly_crimes') }}
),

loc_row as (
    SELECT
        *
        ,ROW_NUMBER() OVER (PARTITION BY loc_key ORDER BY loc_key) as rn
    FROM loc
)

SELECT
    loc_key
    ,lat
    ,lng
    ,zip
FROM 
    loc_row
WHERE
    rn = 1