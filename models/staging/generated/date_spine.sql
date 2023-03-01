with
    date_spine as ({{ dbt_utils.date_spine(
        datepart="day",
        start_date="cast('2019-01-01' as date)",
        end_date= "current_date + interval '2 years'"
    )
    }}),
    add_fy as (
        select
        *,
        case
            when extract(month from date_day) < 7
            then 'FY'||substring(extract(year from date_day)::text,3,2)
            else 'FY'||substring((extract(year from date_day)+1)::text,3,2)
            end 
        as fiscal_year,
        current_timestamp as updated_at
        from date_spine)
select * from add_fy