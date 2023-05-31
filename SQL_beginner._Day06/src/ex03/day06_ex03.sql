CREATE UNIQUE INDEX idx_person_discounts_unique ON person_discounts (person_id, pizzeria_id);


SET enable_seqscan = OFF;

EXPLAIN (ANALYSE, TIMING OFF)
SELECT *
FROM person_discounts
WHERE person_id = 4
  AND pizzeria_id = 6;

--
-- create unique index idx_menu_unique on menu(pizzeria_id, pizza_name);
--
-- set enable_seqscan = OFF;
-- explain analyse
--     SELECT pizzeria_id, pizza_name
-- FROM menu
-- where pizza_name = 'cheese pizza' and pizzeria_id = 2