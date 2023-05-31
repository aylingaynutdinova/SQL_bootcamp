
INSERT INTO menu (id, pizzeria_id, pizza_name, price)
SELECT COALESCE(MAX(id),0) + 1, (SELECT id FROM pizzeria WHERE name = 'Dominos'), 'sicilian pizza', 900
FROM menu;