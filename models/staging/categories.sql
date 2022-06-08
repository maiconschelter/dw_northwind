WITH source_data AS (
    SELECT category_id AS id,
           category_name AS name,
           description
      FROM {{ source('northwind_dw', 'categories') }}
)

SELECT *
  FROM source_data