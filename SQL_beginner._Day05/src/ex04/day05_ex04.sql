create unique index idx_menu_unique on menu(pizzeria_id, pizza_name);

set enable_seqscan = OFF;
explain analyse
    SELECT pizzeria_id, pizza_name
FROM menu
where pizza_name = 'cheese pizza' and pizzeria_id = 2