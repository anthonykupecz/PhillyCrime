{#
    This macro returns the crime level for the crime
    UCR <800 = Violent 
    UCR >= 800 Non-Violent 
#}

{% macro get_crime_level(ucr) -%}

    case  
        when {{ dbt.safe_cast(ucr, api.Column.translate_type("integer")) }} < 800 then 'Violent'
        else 'Non-Violent'
    end

{%- endmacro %}