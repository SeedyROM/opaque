require "logger"

module Opaque
  extend self
  include Injector
  dependency :logger, Logger.new(STDOUT, level: Logger::INFO)
end
