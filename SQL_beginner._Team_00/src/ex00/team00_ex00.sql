CREATE TABLE IF NOT EXISTS graph (
    point1 char NOT NULL,
    point2 char NOT NULL,
    cost   int  NOT NULL
);

INSERT INTO graph (point1, point2, cost)
VALUES ('A', 'B', 10),
       ('A', 'C', 15),
       ('C', 'B', 35),
       ('B', 'C', 35),
       ('D', 'A', 20),
       ('D', 'B', 25),
       ('C', 'D', 30),
       ('A', 'D', 20),
       ('D', 'C', 30),
       ('C', 'A', 15),
       ('B', 'A', 10),
       ('B', 'D', 25);

CREATE VIEW v_tmp_direction AS (
WITH RECURSIVE direction AS (
    SELECT
        point1::bpchar as tour,
        point1,
        point2,
        cost,
        cost as sum
    FROM
        graph
    WHERE
        point1 = 'A'
    UNION ALL
    SELECT
        prev.tour|| ',' || prev.point2 as tour,
        next.point1,
        next.point2,
        prev.cost,
        prev.sum + next.cost AS sum
    FROM
        graph as next
    INNER JOIN direction as prev ON next.point1 = prev.point2
    WHERE tour NOT LIKE '%' || prev.point2 || '%'
)
SELECT * FROM direction
);

SELECT sum as total_cost,
       '{' || tour || ',' || point2 || '}' as tour
FROM v_tmp_direction
WHERE length(tour) = 7 AND
      point2 = 'A' AND
      sum = (SELECT min(sum) FROM v_tmp_direction WHERE length(tour) = 7 AND point2 = 'A')
ORDER BY 1,2;



