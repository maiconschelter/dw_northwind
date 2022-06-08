WITH
employees AS (
    SELECT *
      FROM {{ ref('employees') }}
),

transformed AS (
    SELECT ROW_NUMBER() OVER(ORDER BY id) AS sk,
           id,
           last_name,
           first_name,
           birth_date,
           hire_date,
           address,
           city,
           region,
           postal_code,
           country
      FROM employees
)

SELECT *
  FROM transformed