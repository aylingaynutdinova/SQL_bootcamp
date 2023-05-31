SELECT * FROM ((SELECT pizzeria.name, COUNT(*), 'order' AS action_type
FROM person_order
JOIN menu
ON menu_id = menu.id
JOIN pizzeria
ON menu.pizzeria_id = pizzeria.id
GROUP BY pizzeria.name
ORDER BY 2 DESC
LIMIT 3)
UNION ALL
(SELECT pizzeria.name, COUNT(*), 'visit' AS action_type
FROM person_visits
JOIN pizzeria
    ON person_visits.pizzeria_id = pizzeria.id
GROUP BY pizzeria.name
ORDER BY 2 DESC
LIMIT 3)) AS new_table
ORDER BY action_type ASC, 2 DESC, 1

