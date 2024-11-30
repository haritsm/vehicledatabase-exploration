with source_data as (
        select 
            year
            , make
            , model
            , is_model_electric
            , trim
            , condition
            , REPLACE(REPLACE(trade_in, '$', ''), ',', '')::DECIMAL(10, 2) as trade_in -- Cleaning and converting trade_in values
            , REPLACE(REPLACE(private_party, '$', ''), ',', '')::DECIMAL(10, 2) as private_party -- Cleaning and converting private_party values
            , REPLACE(REPLACE(dealer_detail, '$', ''), ',', '')::DECIMAL(10, 2) as dealer_detail -- Cleaning and converting dealer_detail values
            , current_localtimestamp() as ingestion_timestamp
            , cast(current_localtimestamp() as date) as ingestion_date
        from 
            vehicle_year_make_model_value
    ),

    add_hash as (
        select 
            distinct 
            MD5(CONCAT(
                cast(ingestion_date as string)
                , year
                , make
                , model
                , is_model_electric
                , trim
                , condition
                , trade_in
                , private_party
                , dealer_detail)
                ) AS id
            , *
        from 
            source_data
    )

    select *
    from add_hash