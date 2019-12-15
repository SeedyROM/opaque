require "logger"

require "./opaque/injector"
require "./opaque/server"

module Opaque
  include Injector
  VERSION = "0.1.0"

  dependencies do
    dependency :logger, Logger.new(STDOUT, Logger::INFO)
  end

  server = Server.new()
  server.listen()
end
