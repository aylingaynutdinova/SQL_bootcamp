WITH generate_date AS (SELECT date::date as missing_date
                       FROM generate_series('2022-01-01'::date, '2022-01-10'::date, '1 day'::interval) date),
     old_table AS (SELECT visit_date
                   FROM person_visits
                   WHERE person_id = 1
                      OR person_id = 2)
SELECT generate_date.missing_date
FROM generate_date
         LEFT JOIN old_table
                   ON old_table.visit_date = generate_date.missing_date
WHERE old_table.visit_date IS NULL
ORDER BY missing_date