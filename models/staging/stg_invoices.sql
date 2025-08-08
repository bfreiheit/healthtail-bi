select
    month_invoice,
    invoice_id,
    supplier,
    med_name,
    round(packs, 2) as packs,
    price,
    round(total_price, 2) as total_price
from {{ source('raw', 'invoices') }}
