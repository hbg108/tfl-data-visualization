{{
    config(
        materialized='table'
    )
}}

select 
    FORMAT_TIMESTAMP("%Y", travel_date) as travel_year,
    FORMAT_TIMESTAMP("%m", travel_date) as travel_month,
    station,
    sum(entry_tap_count) as entry_tap_count,
    sum(exit_tap_count) as exit_tap_count,
    sum(total_tap_count) as total_tap_count
from {{ ref('station_footfall_daily') }}
group by 1, 2, 3