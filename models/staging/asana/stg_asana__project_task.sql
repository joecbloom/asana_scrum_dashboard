select
   project_id,
   task_id
from
    {{source('asana', 'project_task')}}