SELECT
    trading_currency
FROM
    {{ ref('issuer_risk_report') }}
WHERE
    trading_currency NOT IN (
        'CZK',
        'EUR',
        'GBP',
        'HUF',
        'JPY',
        'PLN',
        'RON',
        'RUB',
        'SEK',
        'UDI',
        'USD'
    )
