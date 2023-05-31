COMMENT ON TABLE person_discounts is 'This table shows price for each pizza with applied discounts';
COMMENT ON COLUMN person_discounts.id IS 'PRIAMRY KEY';
COMMENT ON COLUMN person_discounts.person_id IS 'Person id';
COMMENT ON COLUMN person_discounts.pizzeria_id IS 'Id of pizzerias';
COMMENT ON COLUMN person_discounts.discount IS 'Discount in %';

-- SELECT * FROM person_discounts