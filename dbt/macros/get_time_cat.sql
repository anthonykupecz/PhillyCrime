{#
    This macro returns the category for the hour
    '[6,12]' --> 'Morning'
    '[13, 18]-' --> "Afternoon"
    '[19, 23] | 0' --> "Evening"
    [1,5] --> 'Early Morning'
#}

{% macro get_time_cat(hour) -%}

    case 
        when {{hour}} BETWEEN 6 AND 12 then 'Morning'
        when {{hour}} BETWEEN 13 AND 18 then 'Afternoon'
        when {{hour}} BETWEEN 1 AND 5 then 'Early Morning'
        when ({{hour}} BETWEEN 19 AND 23) OR {{hour}} = 0 then 'Evening'
        else NULL
    end

{%- endmacro %}