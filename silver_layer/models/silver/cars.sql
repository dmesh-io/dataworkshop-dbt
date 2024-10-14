{{ config(materialized='table') }}

with source_data as (
    select
        carid as car_id,
        Brand,
        Price,
        Body,
        Mileage,
        EngineV,
        EngineType,
        Registration,
        Year,
        Model
        -- * except (`_airbyte_raw_id`, `_airbyte_extracted_at`, `_airbyte_generation_id`, `_airbyte_meta`, carid)
    from {{source("bronze_layer", "car_stock")}}
)

select * from source_data
