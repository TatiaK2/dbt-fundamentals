with customers as (
    select * from {{ref('stg_customers')}}
),

orders as (
    select * from {{ref('stg_orders')}}
),

payments as (
    select * from {{ref('stg_payments')}}
),

totals as (

    select order_id,
    sum(case when status='success' then amount else 0 end) as amount
    from payments
    group by order_id
)

select o.order_id,
       o.customer_id,
       o.order_date,
       coalesce(t.amount, 0) as amount

from orders o 
left join totals t on (o.order_id = t.order_id)
