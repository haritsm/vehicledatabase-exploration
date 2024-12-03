WITH staging_vehicle_brand AS (
    SELECT DISTINCT
        cast(id as string) AS brand_id,
        cast(make as string) AS brand_name,
        ingestion_timestamp,
        ingestion_date,
        current_localtimestamp() as load_timestamp
    FROM {{ref('bronze_vehicle_make')}}
)

select * from staging_vehicle_brand