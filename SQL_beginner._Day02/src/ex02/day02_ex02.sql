SELECT COALESCE(person.name, '-')    AS person_name,
       COALESCE(pv.visit_date, null) AS visit_date,
       COALESCE(pizzeria.name, '-')  AS pizzeria_name
FROM person
         FULL OUTER JOIN (SELECT * FROM person_visits WHERE visit_date BETWEEN '2022-01-01' AND '2022-01-03') pv
                         ON person.id = pv.person_id
         FULL OUTER JOIN pizzeria
                         ON pv.pizzeria_id = pizzeria.id
ORDER BY 1, 2, 3