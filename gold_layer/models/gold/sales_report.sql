{{ config(materialized='table') }}

with join_customer_data as (
  select
    *
   from {{ source("silver_layer", "sales") }} as sales
   left join {{ source("silver_layer", "customer_data") }} as customers
   on sales.customer_id = customers.customer_id
), 

join_car_data as (
  select
    *
  from join_customer_data
  left join {{ source("silver_layer", "cars") }} as cars
  on join_customer_data.car_id = cars.car_id
)

select
  sale_id,
  sale_datetime,
  first_name,
  last_name,
  address,
  body,
  year,
  brand,
  model,
  price,
  enginev,
  mileage,
  enginetype,
  registration
from join_car_data