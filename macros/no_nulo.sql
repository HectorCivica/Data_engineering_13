{% macro column_not_null(table, column) %}
    {% set query %}
        SELECT COUNT(*)
        FROM {{ table }}
        WHERE {{ column }} IS NULL
    {% endset %}
    
    {% set result = run_query(query) %}
    {% if result['data'][0][0] == 0 %}
        {{ return(true) }}
    {% else %}
        {{ return(false) }}
    {% endif %}
{% endmacro %}
