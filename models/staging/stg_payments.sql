{{
    config ( 
        materialized='view'
    )

}}

with source as (

    select 
        id as payment_id,
        orderid as order_id,
        paymentmethod as payment_method,
        status,
        amount,
        created as created_at,
        date(created) as created_date_day,
        _batched_at as batched_at

    from {{ source("stripe", "payment") }}
)

select * from source