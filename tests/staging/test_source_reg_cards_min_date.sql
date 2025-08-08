select min(date_registration)
from {{ source('raw', 'visits') }} as vst
inner join {{ source('raw', 'healthtail_reg_cards') }} as crd on vst.patient_id = crd.patient_id
having min(date_registration) > min(visit_datetime)
