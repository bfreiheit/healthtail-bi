select 
date_trunc(visit_datetime, month) as date_month,
diagnosis, 
pet_type,
breed,
gender,
count(visit_id) as cnt_vists,
sum(med_cost) as sum_med_cost,
date_diff(max(visit_datetime), min(date_registration), day) as visit_duration,
avg(med_dosage) as avg_med_dosage,
avg(patient_age) as avg_patient_age

from {{ ref('stg_visits')}} vst 
left join {{ ref('stg_reg_cards')}} crd on crd.patient_id = vst.patient_id
group by 1, 2, 3, 4, 5