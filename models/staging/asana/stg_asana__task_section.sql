select
    task_id,
    section_id
from
    {{source('asana', 'task_section')}}