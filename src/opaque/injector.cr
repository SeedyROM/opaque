module Opaque::Injector
  macro dependencies(module_name = "Opaque::Dependencies", &block)
    module {{module_name.id}}
      extend self
      include Injector

      {{block.body}}
    end
  end

  macro inject(name)
    def {{name.id}}
      Opaque::Dependencies.{{name.id}}
    end
  end

  macro dependency(name, value)
    @@{{name.id}} = {{value}}
    def {{name.id}}
      @@{{name.id}}
    end
  end
end
