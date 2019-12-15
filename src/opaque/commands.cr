require "./helpers"

module Opaque
  # Application commands.
  class CommandType
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

    def serialize(*args)
      if @arity != args.size
        raise "Function #{@type} failed for function invocation with #{args.size} arguments, expected #{@arity}"
      end

      "#{@type} " + args.join(" ")
    end
  end

  class Command

  end
end
