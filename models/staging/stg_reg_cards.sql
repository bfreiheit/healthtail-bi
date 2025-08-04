select
initcap(owner_name) as owner_name,
initcap(patient_name) as patient_name,
initcap(pet_type) as pet_type,
initcap(coalesce(breed, 'unknown', breed)) as breed,
initcap(gender) as gender
from {{ source('raw', 'healthtail_reg_cards')}}