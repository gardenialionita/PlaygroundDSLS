{{ config(materialized="table") }}

with
    source_data as (

        select customer_id, first_name, last_name, dob, email
        from raw_customers

    )

select *
from source_data
