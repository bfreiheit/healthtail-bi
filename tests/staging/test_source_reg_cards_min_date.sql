select 
min(date_registration)
from {{ source('raw', 'visits')}} vst 
join {{ source('raw', 'healthtail_reg_cards')}} crd on crd.patient_id = vst.patient_id
having min(date_registration) > min(visit_datetime)