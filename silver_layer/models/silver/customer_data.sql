{{ config(materialized='table') }}

with source_data as (
    select
        customerid as customer_id,
        firstname as first_name,
        lastname as last_name,
        address
    from {{source("bronze_layer", "customers")}}
)

select * from source_data
