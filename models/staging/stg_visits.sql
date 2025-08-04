select 
visit_id,
patient_id,
visit_datetime,
initcap(doctor) as doctor,
initcap(diagnosis) as diagnosis,
initcap(med_prescribed) as med_prescribed,
round(med_dosage, 2) as med_dosage,
round(med_cost, 2) as med_cost
from {{ source('raw', 'visits')}}