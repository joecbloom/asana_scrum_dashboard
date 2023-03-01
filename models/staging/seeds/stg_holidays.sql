with
    holidays as (select * from {{ ref('holidays') }})
    
select
    holiday,
    date_observed::date
from holidays