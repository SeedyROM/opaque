require "./helpers"

module Opaque
  class Command
    include Helpers

    enum Type : UInt8
      GET,
      SET,
      PUSHL,
      PUSHR,
      POPL,
      POPR
    end
    enum_to_scope Type

    property type : Type
    property arity : UInt8


    def initialize(@type, @arity) end

    # Spread enum Type into the namespace
    # {% for name in Type.constants %}
    #   {{name.id}} = Type::{{name.id}}
    # {% end %}
  end
end
