WITH source_data AS (
    SELECT supplier_id AS supplier,
           category_id AS category,
           product_id AS id,
           product_name AS name,
           quantity_per_unit AS qty_unit,
           unit_price AS price,
           CAST(units_in_stock AS INT) AS in_stock,
           CAST(units_on_order AS INT) AS in_order,
           CAST(reorder_level AS INT) AS rec_level,
           CASE
                WHEN discontinued = 0 THEN TRUE
                ELSE FALSE
           END AS is_discontinued
      FROM {{ source('northwind_dw', 'products') }}
)

SELECT *
  FROM source_data