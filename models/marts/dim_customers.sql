WITH
customers AS (
    SELECT *
      FROM {{ ref('customers') }}
),

transformed AS (
    SELECT ROW_NUMBER() OVER(ORDER BY id) AS sk,
           id,
           name,
           address,
           city,
           region,
           postal_code,
           country
      FROM customers
)

SELECT *
  FROM transformed