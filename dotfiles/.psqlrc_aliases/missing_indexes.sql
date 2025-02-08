-- Identifies foreign key constraints in PostgreSQL tables that might be missing indexes.
SELECT src_table,
       dst_table,
       fk_name,
       pg_size_pretty(s_size) AS s_size,
       pg_size_pretty(d_size) AS d_size,
       d
FROM (
    SELECT DISTINCT ON (1,2,3,4,5)
           textin(regclassout(c.conrelid)) AS src_table,
           textin(regclassout(c.confrelid)) AS dst_table,
           c.conname AS fk_name,
           pg_relation_size(c.conrelid) AS s_size,
           pg_relation_size(c.confrelid) AS d_size,
           array_upper(di.indkey::int[], 1) + 1 - array_upper(c.conkey::int[], 1) AS d
    FROM pg_constraint c
      LEFT JOIN pg_index di ON di.indrelid = c.conrelid AND array_to_string(di.indkey, '' '') ~ (''^'' || array_to_string(c.conkey, '' '') || ''( |$)'')
      JOIN pg_stat_user_tables st ON st.relid = c.conrelid
    WHERE c.contype = ''f''
    ORDER BY 1,2,3,4,5,6 ASC
) mfk
WHERE mfk.d is distinct from 0
  AND mfk.s_size > 1000000
ORDER BY mfk.s_size DESC, mfk.d DESC;
