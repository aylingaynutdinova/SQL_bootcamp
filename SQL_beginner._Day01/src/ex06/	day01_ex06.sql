 SELECT action_date, name AS person_name FROM person
     INNER JOIN
    (SELECT order_date AS action_date, person_id  FROM person_order
    INTERSECT
    SELECT visit_date AS action_date, person_id  FROM person_visits) as new_table
        ON person.id = new_table.person_id
ORDER BY action_date, person_id DESC

