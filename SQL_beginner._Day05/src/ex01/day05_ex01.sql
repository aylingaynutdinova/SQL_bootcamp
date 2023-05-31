SET ENABLE_SEQSCAN TO OFF;
EXPLAIN (ANALYZE, TIMING OFF)
SELECT pizza_name, name  AS pizzeria_name
FROM menu JOIN pizzeria p on menu.pizzeria_id = p.id
