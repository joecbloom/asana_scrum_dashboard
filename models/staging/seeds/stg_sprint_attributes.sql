with
    sprint_attributes as (select * from {{ ref("sprint_attributes") }})

select
    sprint,
    start_date::date,
    end_date::date
from sprint_attributes
