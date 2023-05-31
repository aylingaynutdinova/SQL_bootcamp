INSERT INTO person_order (id, person_id, menu_id, order_date)
SELECT ((SELECT MAX(id) FROM person_order) + i),
       (i),
       (SELECT id FROM menu WHERE pizza_name = 'greek pizza'),
       '2022-02-25'
FROM generate_series(1, (SELECT MAX(id) FROM person)) as t(i);

