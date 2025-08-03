select * 

from {{ source('raw', 'visits')}}