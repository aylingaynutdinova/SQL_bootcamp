SELECT name
FROM pizzeria
         JOIN
     ((SELECT pizzeria_id
       FROM person_visits
                JOIN person
                     ON person_visits.person_id = person.id
       WHERE name = 'Andrey')
      EXCEPT
      (SELECT pizzeria_id
       FROM menu
                JOIN person_order
                     ON menu.id = person_order.menu_id
                JOIN person
                     ON person_order.person_id = person.id
       WHERE name = 'Andrey')) AS new_table
ON new_table.pizzeria_id = pizzeria.id