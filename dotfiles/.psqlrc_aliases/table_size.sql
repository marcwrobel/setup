-- Retrieves the sizes of all tables, with and without indexes/TOAST.
SELECT table_schema,
       table_name,
       pg_relation_size(quote_ident(table_schema) || '.' || quote_ident(table_name)) AS size,
       pg_total_relation_size(quote_ident(table_schema) || '.' || quote_ident(table_name)) AS total_size
FROM information_schema.tables
WHERE table_type = 'BASE TABLE'
  AND table_schema NOT IN ('information_schema', 'pg_catalog')
ORDER BY pg_total_relation_size(quote_ident(table_schema) || '.' || quote_ident(table_name)) DESC, table_schema, table_name;
