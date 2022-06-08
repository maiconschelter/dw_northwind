WITH source_data AS (
    SELECT order_id AS `order`,
           product_id AS product,
           unit_price,
           quantity,
           discount
      FROM {{ source('northwind_dw', 'order_details') }}
)

SELECT *
  FROM source_data