{{
    config ( 
        materialized='view'
    )

}}

with source as (

    select 
        id as order_id,
        user_id,
        order_date as ordered_at,
        status as order_status,
        _etl_loaded_at as loaded_at
        
    from {{ source("jaffle_shop", "orders") }}
)

select * from source