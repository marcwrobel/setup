-- Retrieves information about the current database connections and their activity from the pg_stat_activity.
SELECT datname,
       pid,
       usename,
       application_name,
       client_addr,
       client_hostname,
       client_port,
       query,
       state
FROM pg_stat_activity;
