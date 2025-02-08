-- Retrieves information about currently running VACUUM operations.
SELECT  datname,
        usename,
        pid,
        waiting,
        CURRENT_TIMESTAMP - xact_start AS xact_runtime,
        query
FROM pg_stat_activity
WHERE UPPER(query) LIKE '%VACUUM%'
ORDER BY xact_start;
