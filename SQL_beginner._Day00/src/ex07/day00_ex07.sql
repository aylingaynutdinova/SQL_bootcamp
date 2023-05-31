SELECT name, id,
    CASE
        WHEN age >= 10 AND age <=20 THEN 'interval #1'
        WHEN age > 20 AND age <24 THEN 'interval #2'
        else 'interval #3'
    END AS interval_info
FROM person
ORDER BY interval_info ASC