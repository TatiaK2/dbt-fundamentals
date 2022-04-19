{%- set status_types = ['placed', 'shipped', 'returned', 'completed'] -%}

with orders as (
    select *
    from {{ref('stg_orders')}}
),

final as (

    select customer_id,
    {% for status in status_types -%}
    sum(case when status= '{{status}}' then 1 else 0 end) as num_{{status}}
    {%- if not loop.last -%}
    ,
    {%- endif %}
    {% endfor -%}
    from orders
    group by customer_id
    
)

select * from final