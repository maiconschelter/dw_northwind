WITH source_data AS (
    SELECT order_id AS id,
           customer_id AS customer,
           employee_id AS employee,
           order_date,
           required_date,
           shipped_date,
           ship_via,
           freight,
           ship_name,
           ship_address,
           ship_city,
           ship_region,
           ship_postal_code,
           ship_country
      FROM {{ source('northwind_dw', 'orders') }}
)

SELECT *
  FROM source_data