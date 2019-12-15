require "logger"

module Opaque::Dependencies
  extend self
  include Injector

  dependency :logger, Logger.new(STDOUT, level: Logger::INFO)
end
