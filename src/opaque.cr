require "./opaque/injector"
require "./opaque/dependencies"
require "./opaque/server"

module Opaque
  VERSION = "0.1.0"
  server = Server.new()
  server.listen()
end
