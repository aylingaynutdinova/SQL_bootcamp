
SELECT
    (SELECT name AS person_name FROM person WHERE id = person_order.person_id),
    (SELECT pizza_name AS pizza_name FROM menu WHERE id = person_order.menu_id),
    (SELECT name AS pizzeria_name FROM pizzeria WHERE id = menu.pizzeria_id)
FROM person_order
JOIN menu
    ON person_order.menu_id = menu.id
JOIN person
    ON person.id = person_order.person_id
ORDER BY person_name, pizza_name, pizzeria_name;
