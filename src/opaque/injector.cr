module Opaque::Injector
  macro inject(name)
    def {{name.id}}
      Opaque.{{name.id}}
    end
  end

  macro dependency(name, value)
    @@{{name.id}} = {{value}}
    def {{name.id}}
      @@{{name.id}}
    end
  end
end
