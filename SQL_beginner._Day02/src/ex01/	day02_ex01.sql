SELECT date::date as missing_date
FROM generate_series('2022-01-01'::date, '2022-01-10'::date, '1 day'::interval) date
         LEFT JOIN
     (SELECT visit_date
      FROM person_visits
      WHERE person_id = 1
         OR person_id = 2) AS old_table
     ON date = old_table.visit_date
WHERE visit_date IS NULL
