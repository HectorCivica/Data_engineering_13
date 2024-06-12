{{
    codegen.generate_source(
        schema_name = 'DBT',
        database_name = 'ALUMNO13DEVSILVER_DB',
        table_names = ['STG_SQL_SERVER_DBO__ADDRESSES
','DIM_DATE','STG_SQL_SERVER_DBO__DIMENSION_SHIPPING','STG_SQL_SERVER_DBO__DIMENSION_STATUS','STG_SQL_SERVER_DBO__PRODUCTS','STG_SQL_SERVER_DBO__PROMOS','STG_SQL_SERVER_DBO__USERS'],
        generate_columns = True,
        include_descriptions=True,
        include_data_types=True,
        name='source_model',
        include_database=True,
        include_schema=True
        )
}}
-- Lo de arriba esta mal

{% set models_to_generate = codegen.get_models(directory='staging/sql_server_dbo', prefix='stg_') %}
{{ codegen.generate_model_yaml(
    model_names = models_to_generate
) }}

