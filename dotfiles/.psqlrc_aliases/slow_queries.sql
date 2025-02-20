-- Shows slow queries.
SELECT (total_time / 1000 / 60) as total_minutes,
       (total_time/calls) as average_time,
       query
FROM pg_stat_statements
ORDER BY 1 DESC;
