select 
date_trunc(month_invoice, month) as date_month,
med_name,
sum(packs) as total_packs,
sum(total_price) as total_value,
"stock_in" as stock_movement
from {{ ref('stg_invoices')}}
group by 1, 2

union all

select 
date_trunc(visit_datetime, month) as date_month,
med_prescribed as med_name,
sum(med_dosage) as total_packs,
sum(med_cost) as total_value,
"stock_out" as stock_movement
from {{ ref('stg_visits')}}
group by 1, 2