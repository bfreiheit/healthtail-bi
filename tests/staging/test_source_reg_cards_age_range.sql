select patient_age
from {{ source('raw', 'healthtail_reg_cards') }}
where patient_age < 1 and patient_age > 20
