WITH new_table AS (
    SELECT pizzeria.name, gender FROM person_visits
        JOIN person ON person_id = person.id
        JOIN pizzeria ON pizzeria_id = pizzeria.id),
    male_table AS (SELECT name FROM new_table WHERE gender = 'male'),
    female_table AS (SELECT name FROM new_table WHERE gender = 'female')

SELECT name AS pizzeria_name
FROM (
    (SELECT * FROM  male_table EXCEPT ALL SELECT * FROM female_table)
    UNION ALL
    (SELECT * FROM female_table EXCEPT ALL SELECT * FROM male_table)
     ) AS uall
ORDER BY pizzeria_name;
