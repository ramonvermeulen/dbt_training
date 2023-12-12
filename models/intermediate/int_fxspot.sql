{{ config(materialized='view') }}

SELECT
    'EUR' AS base_currency,
    'EUR' AS foreign_currency,
    1 AS price,
    '2023-12-11' AS as_of_date

UNION ALL

SELECT
    fx_spot.base_currency,
    fx_spot.foreign_currency,
    fx_spot.price,
    fx_spot.as_of_date
FROM {{ ref('stg_fxspot') }} AS fx_spot
WHERE
    base_currency = 'EUR'
    AND as_of_date = '2023-12-11'
