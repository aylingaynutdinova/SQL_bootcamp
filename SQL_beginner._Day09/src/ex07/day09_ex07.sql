CREATE OR REPLACE FUNCTION func_minimum(VARIADIC arr numeric[]) RETURNS numeric AS $$
SELECT min($1[i])
FROM generate_subscripts($1, 1) g(i);
$$
LANGUAGE SQL;

SELECT func_minimum(10, 1, -5, 4.4);

