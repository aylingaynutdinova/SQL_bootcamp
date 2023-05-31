--s1
BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED;

--s2
BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED;

--s1
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

--s2
UPDATE pizzeria SET rating = 3.6 WHERE name = 'Pizza Hut';
COMMIT;

--s1
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
COMMIT;
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

--s2
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
