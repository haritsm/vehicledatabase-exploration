WITH staging_vehicle_brand AS (
    SELECT DISTINCT
        id AS brand_id,
        make AS brand_name,
        ingestion_timestamp,
        ingestion_date,
        current_localtimestamp() as load_timestamp
    FROM {{ref('bronze_vehicle_make')}}
)

select * from staging_vehicle_brand