WITH 
silver_fact_vehicle_value_data AS (
    SELECT 
        model_electric_flag,
        CASE 
            WHEN brand_name IN ('toyota', 'honda', 'nissan', 'acura', 'infiniti', 'subaru', 'lexus', 'mitsubishi', 'mazda') THEN 'Japan'
            WHEN brand_name IN ('ford', 'chevrolet', 'tesla', 'gmc', 'dodge', 'buick', 'ram', 'lincoln', 'cadillac', 'jeep', 'chrysler') THEN 'USA'
            WHEN brand_name IN ('bmw', 'mercedes-benz', 'volkswagen', 'porsche', 'audi') THEN 'Germany'
            WHEN brand_name IN ('hyundai', 'kia', 'genesis') THEN 'South Korea'
            WHEN brand_name IN ('alfa romeo', 'fiat') THEN 'Italy'
            WHEN brand_name IN ('polestar', 'volvo') THEN 'Sweden'
            WHEN brand_name IN ('rolls-royce', 'aston martin', 'land rover', 'mini', 'bentley') THEN 'UK'
            ELSE 'Other'
        END AS brand_origin_country,
        brand_name,
        vehicle_condition_detail,
        vehicle_registered_year,
        trade_in_price_amount,
        private_party_price_amount,
        dealer_detail_price_amount,
        COUNT(*) AS frequency
    FROM 
        {{ref('silver_fact_vehicle_value')}}
    GROUP BY 
        1,2,3,4,5,6,7,8
) 

select * from silver_fact_vehicle_value_data