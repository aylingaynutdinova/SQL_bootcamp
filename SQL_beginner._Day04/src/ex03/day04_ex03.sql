    SELECT generated_date FROM v_generated_dates
    LEFT JOIN person_visits
     on person_visits.visit_date = v_generated_dates.generated_date
WHERE visit_date IS NULL
