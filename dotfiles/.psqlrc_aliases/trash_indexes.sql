 -- Identifies non-unique indexes on large tables that are rarely used.
SELECT s.schemaname AS sch,
       s.relname AS rel,
       s.indexrelname AS idx,
       s.idx_scan AS scans,
       pg_size_pretty(pg_relation_size(s.relid)) AS table_size,
       pg_size_pretty(pg_relation_size(s.indexrelid)) AS index_size
FROM pg_stat_user_indexes s
  JOIN pg_index i ON i.indexrelid = s.indexrelid
  LEFT JOIN pg_constraint c ON i.indrelid = c.conrelid AND array_to_string(i.indkey, '' '') = array_to_string(c.conkey, '' '')
WHERE i.indisunique IS FALSE
  AND pg_relation_size(s.relid) > 1000000
  AND s.idx_scan < 100000
  AND c.confrelid IS NULL
ORDER BY s.idx_scan ASC, pg_relation_size(s.relid) DESC;
