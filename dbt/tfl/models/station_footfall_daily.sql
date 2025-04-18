{{
    config(
        materialized='table'
    )
}}

with source_data as (
    select *
    from {{ source('tfl','station_footfall') }}
)

select 
    travel_date,
    day_of_week,
    station,
    entry_tap_count,
    exit_tap_count,
    COALESCE(entry_tap_count, 0) + COALESCE(exit_tap_count, 0) as total_tap_count
from source_data