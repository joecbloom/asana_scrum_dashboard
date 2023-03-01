with
    holidays as (select * from {{ref('stg_holidays')}}),
    date_spine as (select * from {{ref('date_spine')}} where date_part('dow', date_day) not in (0,6)),
    sprints as (select * from {{ref('stg_sprint_attributes')}} where start_date <= current_date),
    task as (select * from {{ref('stg_asana__task')}}),

    joined as (
        select
            sprints.sprint,
            date_spine.date_day as "date",
            rank() over (partition by sprints.sprint order by date_spine.date_day) as sprint_day,
            case
				when date_spine.date_day <= current_date
				then coalesce(sum(task.points) filter (where date_spine.date_day <= current_date),0)
				else null
			end
			as points_remaining, 
            max(task.modified_at) as modified_at
        from
            date_spine
            inner join sprints on
                date_spine.date_day >= sprints.start_date and 
                date_spine.date_day <= sprints.end_date
            left join task on
                sprints.sprint = task.data_sprint and
                    (date_spine.date_day <= task.completed_at or
                     task.is_completed = false)
            left join holidays on
                date_spine.date_day = holidays.date_observed
        where holidays.holiday is null
        group by 1,2),

    final as (
        select
            sprint,
            sprint_day,
            "date"::date,
            points_remaining,
            max(modified_at) over (partition by null) as data_as_of
        from joined
        order by date desc)
        
select * from final