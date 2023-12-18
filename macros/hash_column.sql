{%- macro hash_columns(columns=[]) -%}
    SHA256(CONCAT(
        {%- for column in columns -%}
        {{ column }}
        {%- if not loop.last %},{% endif -%}
        {%- endfor -%}
    ))
{%- endmacro -%}
