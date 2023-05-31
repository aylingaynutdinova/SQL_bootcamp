CREATE OR REPLACE FUNCTION fnc_fibonacci(pstop int DEFAULT 10)
RETURNS SETOF int
    AS $$
    WITH RECURSIVE fib(a, b) AS (
    (SELECT 0, 1)
    UNION ALL
  (SELECT b, a + b
  FROM fib
  WHERE b < pstop)
)
SELECT a FROM fib;
$$ LANGUAGE SQL;


SELECT * FROM fnc_fibonacci();