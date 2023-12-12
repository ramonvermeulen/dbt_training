{{ config(materialized='view') }}

SELECT
    as_of_date,
    trade_id,
    trade_ccy AS trading_currency,
    notional AS notional_value
FROM {{ source('ipa', 'issuer_risk') }}
WHERE as_of_date = '2023-12-11'
