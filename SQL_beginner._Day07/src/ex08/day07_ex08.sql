SELECT address, pizzeria.name AS name, COUNT(*) AS count_of_orders
      FROM person_order
               JOIN menu
                    ON menu_id = menu.id
               JOIN pizzeria
                    ON menu.pizzeria_id = pizzeria.id
               JOIN person
                    ON person_order.person_id = person.id
      GROUP BY address, pizzeria.name
      ORDER BY 1, 2