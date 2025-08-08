with cleaned as (
    select
        patient_id,
        owner_id,
        initcap(coalesce(owner_name, 'Unknown')) as owner_name,
        initcap(coalesce(patient_name, 'Unknown')) as patient_name,
        initcap(coalesce(pet_type, 'Unknown')) as pet_type,
        initcap(coalesce(breed, 'Unknown')) as breed,
        initcap(coalesce(gender, 'Unknown')) as gender,
        patient_age,
        date_registration,
        regexp_replace(owner_phone, r'\D+', '') as clean_phone
    from {{ source('raw', 'healthtail_reg_cards') }}
)

select
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
    ) as owner_phone
from cleaned
