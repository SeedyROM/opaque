module Opaque::Helpers
  macro enum_to_scope(enumeration)
    macro finished
      \{% for name in {{enumeration.id}}.constants %}
        \{{name.id}} = {{enumeration.id}}::\{{name.id}}
      \{% end %}
    end
  end
end
