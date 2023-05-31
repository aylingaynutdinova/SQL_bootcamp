--s1
BEGIN TRANSACTION ISOLATION LEVEL SERIALIZABLE;
--s2
BEGIN TRANSACTION ISOLATION LEVEL SERIALIZABLE;

--s1
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

--s2
UPDATE pizzeria SET rating = 3 WHERE name = 'Pizza Hut';
COMMIT;

--s1
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
COMMIT;
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

--s2
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';