{{
    codegen.generate_source(
        schema_name = 'SQL_SERVER_DBO',
        database_name = 'ALUMNO13DEVBRONZEDB',
        table_names = ['ADDRESSES','EVENTS','ORDERS','ORDER_ITEMS','PRODUCTS','PROMOS','USERS'],
        generate_columns = True,
        include_descriptions=True,
        include_data_types=True,
        name='SQL_SERVER_DBO',
        include_database=True,
        include_schema=True
        )
}}


{{ codegen.generate_model_yaml(
    model_names=['stg_sql_server_dbo__addresses','stg_sql_server_dbo__events','stg_sql_server_dbo__order_items','stg_sql_server_dbo__orders','stg_sql_server_dbo__products','stg_sql_server_dbo__promos','stg_sql_server_dbo__users']
) }}