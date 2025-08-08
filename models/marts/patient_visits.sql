select
    date_trunc(vst.visit_datetime, month) as date_month,
    vst.diagnosis,
    crd.pet_type,
    crd.breed,
    crd.gender,
    count(vst.visit_id) as cnt_vists,
    sum(vst.med_cost) as sum_med_cost,
    date_diff(max(vst.visit_datetime), min(crd.date_registration), day) as visit_duration,
    avg(vst.med_dosage) as avg_med_dosage,
    avg(crd.patient_age) as avg_patient_age

from {{ ref('stg_visits') }} as vst
left join {{ ref('stg_reg_cards') }} as crd on vst.patient_id = crd.patient_id
group by 1, 2, 3, 4, 5
