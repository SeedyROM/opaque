require "./helpers"

module Opaque
  # Application commands.
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
  end
end
