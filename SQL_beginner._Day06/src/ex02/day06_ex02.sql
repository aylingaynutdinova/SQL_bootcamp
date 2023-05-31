SELECT person.name,
       menu.pizza_name,
       menu.price,
       (menu.price * ((100 - person_discounts.discount) / 100)) AS discount_price,
       pizzeria.name                                            AS pizzeria_name
FROM person_order
         JOIN menu
              ON menu_id = menu.id
         JOIN person
              ON person_id = person.id
         JOIN pizzeria
              ON menu.pizzeria_id = pizzeria.id
         JOIN person_discounts
              ON (person_order.person_id = person_discounts.person_id AND person_discounts.pizzeria_id = pizzeria.id)
ORDER BY 1, 2

