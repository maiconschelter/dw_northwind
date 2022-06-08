WITH
customers AS (
    SELECT sk,
           id
      FROM {{ ref('dim_customers') }}
),

employees AS (
    SELECT sk,
           id
      FROM {{ ref('dim_employees') }}
),

products AS (
    SELECT sk,
           id
      FROM {{ ref('dim_products') }}
),

order_sk AS (
    SELECT customers.sk AS customer_fk,
           employees.sk AS employee_fk,
           orders.id,
           orders.order_date,
           orders.required_date,
           orders.shipped_date,
           orders.ship_via,
           orders.freight,
           orders.ship_name,
           orders.ship_address,
           orders.ship_city,
           orders.ship_region,
           orders.ship_postal_code,
           orders.ship_country
      FROM {{ ref('orders') }} AS orders
 LEFT JOIN customers
        ON orders.customer = customers.id
 LEFT JOIN employees
        ON orders.employee = employees.id
),

order_details_sk AS (
    SELECT products.sk AS product_fk,
           order_details.order,
           order_details.unit_price,
           order_details.quantity,
           order_details.discount
      FROM {{ ref('order_details') }} AS order_details
 LEFT JOIN products
        ON order_details.product = products.id
),

source_data AS (
    SELECT orders.customer_fk,
           orders.employee_fk,
           orders.id,
           orders.order_date,
           orders.required_date,
           orders.shipped_date,
           orders.ship_via,
           orders.freight,
           orders.ship_name,
           orders.ship_address,
           orders.ship_city,
           orders.ship_region,
           orders.ship_postal_code,
           orders.ship_country,
           order_details.product_fk,
           order_details.order,
           order_details.unit_price,
           order_details.quantity,
           order_details.discount
      FROM order_sk AS orders
 LEFT JOIN order_details_sk AS order_details
        ON orders.id = order_details.order
)

SELECT *
  FROM source_data