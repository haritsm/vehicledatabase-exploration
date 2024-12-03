WITH 

dim_vehicle_brand_model as (
    select distinct
        brand_id
        , model_id
        , brand_name
        , model_name
        , model_electric_flag
    from
        {{ref('silver_dim_vehicle_brand_model')}}
)

, staging_vehicle_brand_value AS (
    select
        cast(bvv.id as string) as value_id
        , dvbm.brand_id
        , dvbm.model_id
        , dvbm.brand_name
        , dvbm.model_name
        , dvbm.model_electric_flag
        , cast(bvv.year as integer) as vehicle_registered_year
        , cast(bvv.trim as string) trim_name
        , cast(bvv.condition as string) as vehicle_condition_detail
        , cast(bvv.trade_in as numeric) as trade_in_price_amount
        , cast(bvv.private_party as numeric) as private_party_price_amount
        , cast(bvv.dealer_detail as numeric) as dealer_detail_price_amount
        , bvv.ingestion_timestamp
        , bvv.ingestion_date
        , current_localtimestamp() as load_timestamp
    from
        {{ref('bronze_vehicle_value')}} bvv
    left join 
        dim_vehicle_brand_model dvbm
    on
        dvbm.brand_name = bvv.make
    and
        dvbm.model_name = bvv.model
) 

select * from staging_vehicle_brand_value