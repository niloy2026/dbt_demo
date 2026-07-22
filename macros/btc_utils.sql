{% macro convert_to_usd(column_name) %}

{{column_name}} * (
     select 
    CLOSE_PRICE_USD
    from {{ ref('btc_usd_max')}}
    where to_date(replace(EVENT_DATE,' UTC',''))= current_date()
)

{% endmacro %}
