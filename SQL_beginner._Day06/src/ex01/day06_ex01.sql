
WITH new_table AS (
    SELECT person_order.person_id, menu.pizzeria_id,
           CASE
           WHEN COUNT(person_id) = 1 THEN 10.5
           WHEN COUNT(person_id) = 2 THEN 22
           ELSE 30
           END AS discount
    FROM person_order
    JOIN menu
        ON person_order.menu_id = menu.id
    GROUP BY person_order.person_id, menu.pizzeria_id
)


INSERT INTO person_discounts(
     SELECT ROW_NUMBER( ) OVER ( ), new_table.person_id, new_table.pizzeria_id, new_table.discount
    FROM new_table
    ORDER BY 2, 3
)
--
SELECT * FROM person_discounts
