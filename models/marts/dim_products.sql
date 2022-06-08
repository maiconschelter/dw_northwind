WITH
products AS (
    SELECT *
      FROM {{ ref('products') }}
),

categories AS (
    SELECT *
      FROM {{ ref('categories') }}
),

source_data AS (
    SELECT ROW_NUMBER() OVER(ORDER BY products.id) AS sk,
           products.supplier,
           products.id,
           products.name,
           products.qty_unit,
           products.price,
           products.in_stock,
           products.in_order,
           products.rec_level,
           products.is_discontinued,
           categories.name AS category
      FROM products
 LEFT JOIN categories
        ON products.category = categories.id
)

SELECT *
  FROM source_data