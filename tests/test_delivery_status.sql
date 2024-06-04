-- Vamos a comprobar que en la tabla de orders, siempre y cuando el status sea preparing o shipped, el delivered_at sea null
select delivered_at, status 
from {{ref('stg_sql_server_dbo__orders')}}
where delivered_at is null and status != 'preparing' and status != 'shipped'