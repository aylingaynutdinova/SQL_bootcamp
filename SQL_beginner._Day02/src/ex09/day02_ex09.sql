SELECT name
FROM person
         JOIN (SELECT person_id, count(*) as count
               FROM person_order
                        JOIN menu
                             ON person_order.menu_id = menu.id
               WHERE pizza_name = 'pepperoni pizza'
                  OR pizza_name = 'cheese pizza'
               GROUP BY person_id) AS new_table
              ON person.id = person_id
WHERE gender = 'female' AND new_table.count > 1
ORDER BY 1

-- SELECT person_id, count(*) as count
-- FROM person_order
--          JOIN menu
--               ON person_order.menu_id = menu.id
-- WHERE pizza_name = 'pepperoni pizza'
--                   OR pizza_name = 'cheese pizza'
-- GROUP BY person_id

-- SELECT name, count(*) as count1
-- FROM person
-- GROUP BY name