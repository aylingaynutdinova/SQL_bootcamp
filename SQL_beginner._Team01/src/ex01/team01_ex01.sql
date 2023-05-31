-- insert into currency values (100, 'EUR', 0.85, '2022-01-01 13:29');
-- insert into currency values (100, 'EUR', 0.79, '2022-01-08 13:29');

WITH transactions as (SELECT user_id, money, balance.updated, currency.name as c_name, currency.rate_to_usd,
                             currency.updated as currency_updated
    FROM balance
    JOIN currency on balance.currency_id = currency.id),

     money1 as (SELECT user_id, c_name, money, updated,
        MAX(updated - currency_updated) AS difference_up
    FROM transactions
    WHERE updated - currency_updated < INTERVAL '0 days'
    GROUP BY user_id, c_name, money, updated),

    money2 as (SELECT user_id, c_name, money, updated,
        MIN(updated - currency_updated) AS difference_up
    FROM transactions
    WHERE updated - currency_updated > INTERVAL '0 days'
    GROUP BY user_id, c_name, money, updated),

    end_table  as (SELECT money1.user_id, money1.c_name, money1.money, money1.updated,
    COALESCE(money2.difference_up, money1.difference_up) as final_difference, person.lastname, person.name
    FROM money2
    FULL JOIN money1 on money1.user_id = money2.user_id and money1.c_name = money2.c_name
        and money1.money = money2.money and  money1.updated = money2.updated
    LEFT JOIN "user" as person on money1.user_id = person.id)

SELECT COALESCE(end_table.name, 'not defined') as name,
       COALESCE(end_table.lastname, 'not defined') as lastname,
       end_table.c_name as currency_name,
   end_table.money * currency.rate_to_usd AS currency_in_usd
    FROM end_table
    LEFT JOIN currency ON end_table.final_difference =
                          (end_table.updated - currency.updated)
                              AND end_table.c_name = currency.name
ORDER BY name DESC, lastname ASC, currency_name ASC;






