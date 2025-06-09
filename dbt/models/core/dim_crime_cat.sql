with crime as (
    select 
        ucr_general
        ,CASE 
            WHEN text_general_code = 'Aggravated Assault Firearm' OR text_general_code = 'Aggravated Assault No Firearm' THEN 'Aggravated Assault'
            WHEN text_general_code = 'Burglary Non-Residential' OR text_general_code = 'Burglary Residential' THEN 'Burglary'
            WHEN text_general_code = 'Homicide - Criminal' OR text_general_code = 'Homicide - Justifiable' THEN 'Homicide'
            WHEN text_general_code = 'Robbery Firearm' OR text_general_code = 'Robbery No Firearm' THEN 'Robbery'
            WHEN text_general_code = 'Theft from Vehicle' OR text_general_code = 'Thefts' THEN 'Theft'
            ELSE text_general_code 
        END as text_general_code
        ,crime_level 

    from {{ ref('stg_philly_crimes') }}
),

crime_cleaned as (
   SELECT 
        *,
        ROW_NUMBER() OVER (PARTITION BY ucr_general ORDER BY ucr_general) as rn 
    FROM crime
)

SELECT 
    ucr_general
    ,text_general_code
    ,crime_level
FROM 
    crime_cleaned
WHERE rn = 1
