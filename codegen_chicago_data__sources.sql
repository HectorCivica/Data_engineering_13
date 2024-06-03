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


