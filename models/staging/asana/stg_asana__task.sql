select
    id as task_id,
    name as task_name,
    custom_data_sprint as data_sprint,
    custom_sprint_priority as priority,
    custom_points as points,
    completed as is_completed,
    completed_at,
    modified_at
from
    {{source('asana', 'task')}}