require "logger"

require "./opaque/**"

module Opaque
  VERSION = "0.1.0"

  include Injector

  dependencies do
    dependency :logger, Logger.new(STDOUT, Logger::INFO)
  end

  set_command = CommandType.new(CommandType::SET, 2u8)
end
