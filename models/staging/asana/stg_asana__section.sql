select
    id as section_id,
    name as section_name,
    project_id
from
    {{source('asana', 'section')}}