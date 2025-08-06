select 
date_trunc(visit_datetime, month) as date_month,
diagnosis, 
med_prescribed, 
pet_type,
breed,
gender,
count(visit_id) as cnt_vists,
sum(med_cost) as sum_med_cost,
min(date_registration) as first_visit_date,
avg(patient_age) as avg_pateient_age

from {{ ref('stg_visits')}} vst 
left join {{ ref('stg_reg_cards')}} crd on crd.patient_id = vst.patient_id
group by 1, 2, 3, 4, 5, 6