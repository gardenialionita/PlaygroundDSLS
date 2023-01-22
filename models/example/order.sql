
/*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml

    Try changing "table" to "view" below
*/
{{ config(materialized="table") }}

with
    customers as (select * from {{ ref("customer") }}),
    orders as (

        select
            customer_id,
            sum(quantity * price) as amount,
            count(a.order_id) as number_of_orders
        from raw_order a
        left join raw_order_items b on (a.order_id = b.order_id)
        group by customer_id

    ),
    final as (
        select a.customer_id, amount, number_of_orders from customers a left join orders b on (a.customer_id = b.customer_id)
    )

select *
from final
