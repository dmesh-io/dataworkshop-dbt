{{ config(materialized='table') }}

with source_data as  (
     select
          value:saleId as sale_id,
          value:customerId as customer_id,
          value:carId as car_id,
          value:dateTime as sale_datetime
    from {{ source("bronze_layer", "car_sales") }}
)

select * from source_data