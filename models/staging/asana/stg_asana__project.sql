select
    id as project_id,
    name as project_name
from
    {{source('asana', 'project')}}