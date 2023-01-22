
/*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml

    Try changing "table" to "view" below
*/
{{ config(materialized="table") }}

with
    source_data as (

        select user_id as customer_id, first_name, last_name, dob, email from raw_customers

    )

select *
from source_data
