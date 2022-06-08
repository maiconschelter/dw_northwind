WITH source_data AS (
    SELECT employee_id AS id,
           last_name,
           first_name,
           birth_date,
           hire_date,
           address,
           city,
           region,
           postal_code,
           country
      FROM {{ source('northwind_dw', 'employees') }}
)

SELECT *
  FROM source_data