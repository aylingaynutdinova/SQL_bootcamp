WITH new_table AS (SELECT address,
      ROUND((MAX(person.age) - MIN(person.age)::float4 / MAX(person.age))::numeric, 2) AS formula,
       ROUND(AVG(age), 2)                                      AS average
FROM person
GROUP BY person.address)
SELECT new_table.address, new_table.formula, new_table.average, CASE
           WHEN new_table.formula > new_table.average THEN 'true'
           ELSE 'false'
           END AS comparison
FROM new_table
ORDER BY 1
