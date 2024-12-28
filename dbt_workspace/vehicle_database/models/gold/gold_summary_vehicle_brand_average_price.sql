WITH 
raw_silver_fact_vehicle_value_data as (
    SELECT
        *
        , 
        CASE 
            WHEN brand_name IN ('toyota', 'honda', 'nissan', 'acura', 'infiniti', 'subaru', 'lexus', 'mitsubishi', 'mazda') THEN 'Japan'
            WHEN brand_name IN ('ford', 'chevrolet', 'tesla', 'gmc', 'dodge', 'buick', 'ram', 'lincoln', 'cadillac', 'jeep', 'chrysler') THEN 'USA'
            WHEN brand_name IN ('bmw', 'mercedes-benz', 'volkswagen', 'porsche', 'audi') THEN 'Germany'
            WHEN brand_name IN ('hyundai', 'kia', 'genesis') THEN 'South Korea'
            WHEN brand_name IN ('alfa romeo', 'fiat') THEN 'Italy'
            WHEN brand_name IN ('polestar', 'volvo') THEN 'Sweden'
            WHEN brand_name IN ('rolls-royce', 'aston martin', 'land rover', 'mini', 'bentley') THEN 'UK'
            ELSE 'Other'
        END AS brand_origin_country
    FROM
        {{ref('silver_fact_vehicle_value')}}
),

silver_fact_vehicle_value_data AS (
    SELECT
        vehicle_registered_year,
        "brand_origin_country" as dimension_type,
        brand_origin_country,
        AVG(trade_in_price_amount) AS avg_trade_in_price,
        AVG(private_party_price_amount) AS avg_private_party_price,
        AVG(dealer_detail_price_amount) AS avg_dealer_price
    FROM
        raw_silver_fact_vehicle_value_data
    GROUP BY
        1,3
    
    union all

    SELECT
        vehicle_registered_year,
        "vehicle_condition_detail" as dimension_type,
        vehicle_condition_detail,
        AVG(trade_in_price_amount) AS avg_trade_in_price,
        AVG(private_party_price_amount) AS avg_private_party_price,
        AVG(dealer_detail_price_amount) AS avg_dealer_price
    FROM
        raw_silver_fact_vehicle_value_data
    GROUP BY
        1,3

    union all

    SELECT
        vehicle_registered_year,
        "brand_name" as dimension_type,
        brand_name,
        AVG(trade_in_price_amount) AS avg_trade_in_price,
        AVG(private_party_price_amount) AS avg_private_party_price,
        AVG(dealer_detail_price_amount) AS avg_dealer_price
    FROM
        raw_silver_fact_vehicle_value_data
    GROUP BY
        1,3

    union all

    SELECT
        vehicle_registered_year,
        "model_electric_flag" as dimension_type,
        model_electric_flag,
        AVG(trade_in_price_amount) AS avg_trade_in_price,
        AVG(private_party_price_amount) AS avg_private_party_price,
        AVG(dealer_detail_price_amount) AS avg_dealer_price
    FROM
        raw_silver_fact_vehicle_value_data
    GROUP BY
        1,3
) 

select * from silver_fact_vehicle_value_data