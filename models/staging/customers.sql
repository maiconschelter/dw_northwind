WITH source_data AS (
    SELECT customer_id AS id,
           company_name AS name,
           address,
           city,
           region,
           postal_code,
           country
      FROM {{ source('northwind_dw', 'customers') }}
)

SELECT *
  FROM source_data