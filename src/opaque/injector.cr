# A simple DSL for createing dependency injected modules/classes.
module Opaque::Injector
  # Full DSL setup, this creates a module for dependencies dynamically.
  #
  # ```
  # include Injector
  #
  # dependencies do
  #   dependency :logger, Logger.new(STDOUT, Logger::INFO)
  # end
  # ```
  macro dependencies(module_name = "Opaque::Dependencies", &block)
    module {{module_name.id}}
      extend self
      include Injector

      {{block.body}}
    end
  end

  # Injects a dependency into a class.
  #
  # ```
  # class Module
  #   inject :dep
  # end
  # ```
  macro inject(name, module_name = "Opaque::Dependencies")
    def {{name.id}}
      {{module_name.id}}.{{name.id}}
    end
  end

  # Adds a dependency to a specified module.
  #
  # ```
  # module Module
  #   dependency :dep, "yes"
  # end
  # ```
  macro dependency(name, value)
    @@{{name.id}} = {{value}}
    def {{name.id}}
      @@{{name.id}}
    end
  end
end
