{% docs load_timestamp %}
Timestamp value of data being loaded into the bronze's and silver's table
{% enddocs %}

{% docs ingestion_timestamp %}
Timestamp value of data being ingested from the API by the Python script
{% enddocs %}

{% docs ingestion_date %}
Date value of data being ingested from the API by the Python script
{% enddocs %}

{% docs id %}
An identifier which represents the row within a table. Located in bronze tables.
{% enddocs %}

{% docs brand_id %}
An identifier which represents the vehicle's brand, located in silver tables
{% enddocs %}

{% docs model_id %}
An identifier which represents the vehicle's brand and model, located in silver tables
{% enddocs %}

{% docs value_id %}
An identifier which represents the vehicle's brand, model, and value, located in silver tables
{% enddocs %}

{% docs year %}
The vehicle's data in a certain registration year, bronze layer version
{% enddocs %}

{% docs vehicle_registered_year %}
The vehicle's data in a certain registration year, silver layer version
{% enddocs %}

{% docs make %}
The brand name of the vehicle, resides in the raw or bronze layer
{% enddocs %}

{% docs brand_name %}
The brand name of the vehicle, resides in the silver layer
{% enddocs %}

{% docs model %}
The model name from each brand/ make of the vehicle, resides in the raw or bronze layer
{% enddocs %}

{% docs model_name %}
The model name from each brand/ make of the vehicle, resides in the silver layer
{% enddocs %}

{% docs is_model_electric %}
A boolean value whether the car is an EV or not
{% enddocs %}

{% docs model_electric_flag %}
A boolean value whether the car is an EV or not, resides in the silver layer
{% enddocs %}

{% docs trim %}
The vehicle's trim details for each model
{% enddocs %}

{% docs trim_name %}
The vehicle's trim details for each model, resides in the silver layer
{% enddocs %}

{% docs condition %}
The vehicle's condition details for each model
{% enddocs %}

{% docs vehicle_condition_detail %}
The vehicle's condition details for each model, resides in the silver layer
{% enddocs %}

{% docs trade_in %}
The vehicle's trade in values depending on the condition details
{% enddocs %}

{% docs trade_in_price_amount %}
The vehicle's trade in values depending on the condition details, resides in the silver layer
{% enddocs %}

{% docs private_party %}
The vehicle's private party values depending on the condition details
{% enddocs %}

{% docs private_party_price_amount %}
The vehicle's private party values depending on the condition details, resides in the silver layer
{% enddocs %}

{% docs dealer_detail %}
The vehicle's dealer detail values depending on the condition details
{% enddocs %}

{% docs dealer_detail_price_amount %}
The vehicle's dealer detail values depending on the condition details, resides in the silver layer
{% enddocs %}