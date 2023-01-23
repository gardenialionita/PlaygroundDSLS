{{ config(materialized="table") }}

with order_jakarta as (select * from {{ ref("order") }} where quantity > 10)
select *
from order_jakarta
