{{ config(materialized='view') }}

SELECT
    as_of_date,
    base_currency,
    foreign_currency,
    price
FROM {{ source('ipa', 'fxspot') }}
WHERE as_of_date = '2023-12-11'
