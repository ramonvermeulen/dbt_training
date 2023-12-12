{{ config(materialized='table') }}

WITH pre AS (
    SELECT
        ir.as_of_date,
        ir.trade_id,
        ir.trading_currency,
        ir.notional_value,
        fx.price
    FROM {{ ref('stg_issuer_risk') }} AS ir
    LEFT JOIN {{ ref('int_fxspot') }} AS fx
        ON ir.as_of_date = fx.as_of_date
        AND ir.trading_currency = fx.foreign_currency
)

SELECT
    as_of_date,
    trade_id,
    trading_currency,
    notional_value,
    price,
    notional_value/price AS notional_value_eur
FROM pre
