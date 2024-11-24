
{{ config(materialized='table') }}

with source_data as (
    select 
        make
        , model
        , current_localtimestamp() as created_timestamp
        , current_localtimestamp() as updated_timestamp 
    from 
        vehicle_year_make_model_value
),

add_hash as (
    select 
        distinct 
        hash(make || '-' || model || '-' || strftime(created_timestamp, '%Y-%m-%d %H:%M:%S') || '-' || strftime(updated_timestamp, '%Y-%m-%d %H:%M:%S')) AS car_id
        , *
    from 
        source_data
)

select *
from add_hash