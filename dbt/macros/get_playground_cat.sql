{#
    This macro returns the category for the playground
    '5_12_YEARS' --> 'Child'
    '2_5_YEARS' --> "Preschool"
    '2_12_YEARS' --> "Mixed"
    ' ' --> NA
    'UNKNOWN' --> NA
#}

{% macro get_playground_cat(play_range) -%}

    case {{play_range}} 
        when '5_12_YEARS' then 'Child'
        when '2_5_YEARS' then 'Preschool'
        when '2_12_YEARS' then 'Mixed'
        when 'UNKNOWN' then NULL
        else NULL
    end

{%- endmacro %}