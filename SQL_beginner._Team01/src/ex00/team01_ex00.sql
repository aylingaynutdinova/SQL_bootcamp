with all_data as (SELECT
    COALESCE(person.name, 'not defined') as name,
    COALESCE(person.lastname, 'not defined') as lastname,
    balance.type as type,
    SUM(balance.money) as volume,
    balance.currency_id
    from "user" as person
    FULL JOIN balance on person.id = balance.user_id
    GROUP BY balance.type, COALESCE(person.lastname, 'not defined'),
             COALESCE(person.name, 'not defined'), currency_id),

    balance_current_name as (SELECT all_data.name, all_data.lastname, all_data.volume, all_data.type,
    COALESCE(currency.name, 'not defined') as currency_name, all_data.currency_id
          FROM all_data
          LEFT JOIN currency on currency.id = all_data.currency_id
          GROUP BY all_data.name, all_data.lastname, all_data.type, all_data.volume,
                   currency_name, all_data.currency_id),

    end_table as (SELECT b.name, b.lastname, b.volume, b.type,
    COALESCE(currency.name, 'not defined') as currency_name, b.currency_id, currency.id, rate_to_usd, lastdate
         from (SELECT id, MAX(updated) as lastdate FROM currency
             GROUP BY currency.id) as currency_data
         LEFT JOIN currency on currency_data.lastdate = currency.updated AND currency_data.id = currency.id
        FULL JOIN balance_current_name b on currency_data.id = b.currency_id)

SELECT end_table.name as name,
       lastname, type, volume, currency_name,
     COALESCE(rate_to_usd, 1) AS last_rate_to_usd,
    COALESCE(volume * rate_to_usd, volume) AS total_volume_in_usd
FROM end_table
ORDER BY name DESC, lastname ASC, type ASC