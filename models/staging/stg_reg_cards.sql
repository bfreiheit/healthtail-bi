WITH cleaned AS (
  SELECT 
    patient_id,
    owner_id,
    initcap(coalesce(owner_name, 'Unknown')) AS owner_name,
    initcap(coalesce(patient_name, 'Unknown')) AS patient_name,
    initcap(coalesce(pet_type, 'Unknown')) AS pet_type,
    initcap(coalesce(breed, 'Unknown')) AS breed,
    initcap(coalesce(gender, 'Unknown')) AS gender,
    patient_age,
    date_registration,
    regexp_replace(owner_phone, r'\D+', '') AS clean_phone
from {{ source('raw', 'healthtail_reg_cards')}}
)
SELECT
  patient_id,
  owner_id,
  owner_name,
  patient_name,
  pet_type,
  breed,
  gender,
  patient_age,
  date_registration,
  concat(
    '+', substr(clean_phone, 1, 2), ' ',
    substr(clean_phone, 3, 4), ' ',
    substr(clean_phone, 7)
  ) AS owner_phone
FROM cleaned