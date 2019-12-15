# Project helpers.
module Opaque::Helpers
  # Spread an enum into a current module/classes scope.
  #
  # ```
  # module Module
  #   include Helpers
  #   enum Time
  #     DAY,
  #     NIGHT
  #   end
  #
  #   enum_to_scope Time
  # end
  # ```
  #
  # `Module::Day == Module::Time::Day`
  #
  macro enum_to_scope(enumeration)
    macro finished
      \{% for name in {{enumeration.id}}.constants %}
        \{{name.id}} = {{enumeration.id}}::\{{name.id}}
      \{% end %}
    end
  end
end
