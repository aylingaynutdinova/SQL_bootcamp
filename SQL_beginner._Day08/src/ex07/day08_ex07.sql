--s1
BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;

--s2
BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;

--s1
UPDATE pizzeria SET rating = 3 WHERE id = 1;

--s2
UPDATE pizzeria SET rating = 3 WHERE id = 2;


--s1
UPDATE pizzeria SET rating = 4 WHERE id = 2;

--s2
UPDATE pizzeria SET rating = 4 WHERE id = 1;


--s1
COMMIT;

--s2
COMMIT;