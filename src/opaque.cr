require "logger"

require "./opaque/helpers"
require "./opaque/injector"
require "./opaque/commands"
require "./opaque/server"

module Opaque
  VERSION = "0.1.0"

  include Injector

  dependencies do
    dependency :logger, Logger.new(STDOUT, Logger::INFO)
  end

  command = Command.new(Command::SET, 2u8)

  server = Server.new()
  server.listen()
end
