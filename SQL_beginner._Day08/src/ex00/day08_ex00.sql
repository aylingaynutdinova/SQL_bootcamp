--s1
BEGIN;

--s2
BEGIN;

--s2
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

--s1
UPDATE pizzeria SET rating = 5 WHERE name = 'Pizza Hut';
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

--s2
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

--s1
COMMIT;

--s2
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
