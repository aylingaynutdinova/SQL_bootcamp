SELECT order_date, concat(name, ' (age:', age, ')') AS person_information
FROM person_order
NATURAL JOIN (SELECT id AS person_id, name, age FROM person) AS pr
ORDER BY order_date, person_information