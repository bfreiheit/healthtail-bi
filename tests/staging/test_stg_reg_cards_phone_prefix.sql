select
  owner_phone
from {{ ref('stg_reg_cards') }}
where not starts_with(owner_phone, '+44')
