SELECT
    t1.TABLE_NAME AS tabla_nombre,
    t1.COLUMN_NAME AS columna_nombre,
    t1.COLUMN_DEFAULT AS columna_defecto,
    t1.IS_NULLABLE AS columna_nulo,
    t1.DATA_TYPE AS columna_tipo_dato,
    COALESCE(t1.NUMERIC_PRECISION, t1.CHARACTER_MAXIMUM_LENGTH) AS columna_longitud,
    PG_CATALOG.COL_DESCRIPTION(t2.OID, t1.DTD_IDENTIFIER::int) AS columna_descripcion,
    t1.DOMAIN_NAME AS columna_dominio
FROM
    INFORMATION_SCHEMA.COLUMNS t1
    INNER JOIN PG_CLASS t2 ON (t2.RELNAME = t1.TABLE_NAME)
WHERE
    t1.TABLE_SCHEMA = 'public'
ORDER BY t1.TABLE_NAME;

SELECT
    conname AS constraint_name,
    conrelid::regclass AS table_name,
    a.attname AS column_name,
    CASE
        WHEN contype = 'p' THEN 'Primary Key'
        WHEN contype = 'f' THEN 'Foreign Key'
    END AS constraint_type,
    conkey AS column_indexes,
    confkey AS referenced_column_indexes,
    confrelid::regclass AS referenced_table_name
FROM
    pg_constraint
    INNER JOIN pg_attribute AS a ON a.attnum = ANY(conkey) AND a.attrelid = conrelid
WHERE
    connamespace = 'public'::regnamespace
    AND (contype = 'p' OR contype = 'f');

select * from payment