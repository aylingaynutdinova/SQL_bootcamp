WITH new_table AS (
    SELECT pizzeria.name, person.gender
    FROM person_order
             JOIN menu
                  ON person_order.menu_id = menu.id
             JOIN pizzeria
                  ON menu.pizzeria_id = pizzeria.id
             JOIN person
                  ON person_order.person_id = person.id),
     male_table AS (SELECT name FROM new_table WHERE gender = 'male'),
     female_table AS (SELECT name FROM new_table WHERE gender = 'female')

SELECT name AS pizzeria_name
FROM (
             (SELECT * FROM male_table EXCEPT SELECT * FROM female_table)
             UNION
             (SELECT * FROM female_table EXCEPT SELECT * FROM male_table)
     ) AS uall
ORDER BY pizzeria_name;


