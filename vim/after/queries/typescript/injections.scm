(call_expression
  (member_expression
    (member_expression
      property: (property_identifier) @_sequelize_property (#eq? @_sequelize_property "sequelize"))
    property: (property_identifier) @_query_property (#eq? @_query_property "query"))
  arguments: (arguments
    (template_string) @sql
    (#offset! @sql 0 1 0 -1)))
