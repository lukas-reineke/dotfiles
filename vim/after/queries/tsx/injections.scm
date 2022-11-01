; extends

(jsx_attribute
  (property_identifier) @_name
  (#eq? @_name "css")
  (jsx_expression
    (template_string) @css
    (#offset! @css 0 1 0 -1)))

(jsx_attribute
  (property_identifier) @_name
  (#eq? @_name "css")
  (string) @css
  (#offset! @css 0 1 0 -1))
