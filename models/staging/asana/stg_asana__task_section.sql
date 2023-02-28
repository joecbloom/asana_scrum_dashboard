select
    task_id,
    section_id
from
    {{source('asana_data_sprints', 'task_section')}}