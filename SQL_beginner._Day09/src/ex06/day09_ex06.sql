DROP FUNCTION IF EXISTS fnc_person_visits_and_eats_on_date(character varying, numeric, date);

CREATE
    OR REPLACE FUNCTION fnc_person_visits_and_eats_on_date(IN pperson varchar DEFAULT 'Dmitriy',
                                                           IN pprice integer DEFAULT 500,
                                                           IN pdate date DEFAULT '2022-01-08')
    RETURNS TABLE
            (
                name varchar
            )
AS
$$
BEGIN
       RETURN QUERY
    SELECT * FROM ((SELECT pizzeria.name
     FROM person_visits
              JOIN pizzeria
                   ON pizzeria.id = pizzeria_id
              JOIN person
                   ON person_visits.person_id = person.id
              JOIN menu
                   ON pizzeria.id = menu.pizzeria_id
     WHERE person.name = pperson
       AND person_visits.visit_date = pdate
       AND menu.price < pprice)
    INTERSECT
    (
        SELECT pizzeria.name
        FROM person_order
                 JOIN person on person_order.person_id = person.id
                 JOIN menu m on m.id = person_order.menu_id
                 JOIN pizzeria on m.pizzeria_id = pizzeria.id

        WHERE person.name = pperson
          AND person_order.order_date = pdate
          AND m.price < pprice
    )) AS new_table;
END;
$$
    LANGUAGE plpgsql;

SELECT *
FROM fnc_person_visits_and_eats_on_date(pperson := 'Anna', pprice := 1300, pdate := '2022-01-01');

SELECT *
FROM fnc_person_visits_and_eats_on_date(pprice := 800);

-- SELECT pizzeria.name
-- FROM person_visits
--          JOIN pizzeria
--               ON pizzeria.id = pizzeria_id
--          JOIN person
--               ON person_visits.person_id = person.id
--          JOIN menu
--               ON pizzeria.id = menu.pizzeria_id
-- WHERE person.name = pperson
--   AND person_visits.visit_date = pdate
--   AND menu.price < pprice $$