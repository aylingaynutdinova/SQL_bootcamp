CREATE SEQUENCE seq_person_discounts
    START WITH 1;
SELECT SETVAL('seq_person_discounts',
              (SELECT MAX(id) FROM person_discounts));
ALTER TABLE person_discounts
    ALTER COLUMN id SET DEFAULT NEXTVAL('seq_person_discounts');

INSERT INTO person_discounts(person_id, pizzeria_id, discount)
VALUES (5, 4, 22)

-- INCREMENT BY 1
-- MINVALUE 1
-- MAXVALUE 1000000;


