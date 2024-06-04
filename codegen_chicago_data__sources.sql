{{
    codegen.generate_source(
        schema_name = 'chicago_data',
        database_name = 'ALUMNO13DEVBRONZEDB',
        table_names = ['CRIMES','DIM_DATE','DIM_LOCATION','DIM_UICR','FCT_CRIMES'],
        generate_columns = True,
        include_descriptions=True,
        include_data_types=True,
        name='chicago_data',
        include_database=True,
        include_schema=True
        )
}}


{% set models_to_generate = codegen.get_models(directory='staging/sql_server_dbo', prefix='stg_') %}
{{ codegen.generate_model_yaml(
    model_names = models_to_generate
) }}