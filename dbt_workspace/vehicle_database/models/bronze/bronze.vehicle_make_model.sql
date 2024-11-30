with source_data as (
    select 
        make
        , model
        , current_localtimestamp() as ingestion_timestamp
        , cast(current_localtimestamp() as date) as ingestion_date
    from 
        vehicle_year_make_model
),

add_hash as (
    select 
        distinct 
        MD5(concat(
            make, '-'
            , model, '-'
            , cast(ingestion_date as string))
        ) AS id
        , *
    from 
        source_data
)

select *
from add_hash