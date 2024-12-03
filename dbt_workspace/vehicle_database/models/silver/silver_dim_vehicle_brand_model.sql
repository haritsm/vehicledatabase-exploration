WITH 

dim_vehicle_brand as (
    select
        brand_id
        , brand_name
    from
        {{ref('silver_dim_vehicle_brand')}}
)

, staging_vehicle_brand_model AS (
    SELECT DISTINCT
        cast(vmm.id as string) AS model_id,
        vb.brand_id,
        cast(vmm.make as string) AS brand_name,
        cast(vmm.model as string) as model_name,
        vmm.is_model_electric as model_electric_flag,
        vmm.ingestion_timestamp,
        vmm.ingestion_date,
        current_localtimestamp() as load_timestamp
    FROM {{ref('bronze_vehicle_make_model')}} vmm
    left join dim_vehicle_brand vb
    on vb.brand_name = vmm.make
)

select * from staging_vehicle_brand_model