{% macro print_project(project=target.project, database=target.database) %}

 
  {{ log('Project =  ' ~ project ~ ', database =  ' ~ database, info=True) }}

{% endmacro %}