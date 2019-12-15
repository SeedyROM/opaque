require "socket"

module Opaque
  # Server configuration object.
  struct ServerConfig
    @@HOST_DEFAULT : String = "localhost"
    @@PORT_DEFAULT : UInt16 = 12480

    getter host : String
    getter port : UInt16

    def initialize(@host = @@HOST_DEFAULT, @port = @@PORT_DEFAULT) end
  end

  # TCP server for clients to connect to.
  #
  # ```
  # server = Server.new("localhost", 12480) # Tese are the defaults, as well so you can ignore arguments
  # server.listen
  # ```
  class Server
    include Injector
    inject :logger

    getter tcp : TCPServer

    def initialize(*config)
      @config = ServerConfig.new(*config)
      @tcp = TCPServer.new(@config.host, @config.port)
    end

    # Handle an incoming connection.
    private def handle_connection(client : TCPSocket)
      loop do
        message = client.gets()
        if message == "quit"
          client.close()
          break
        end
        logger.info("Received message: \"#{message}\"")
        client.puts(message)
      end
    end

    # Listen at a specific address specified by the configuration.
    def listen
      logger.info("started opaque at #{@config.host}:#{@config.port}")
      while client = @tcp.accept?
        spawn handle_connection(client)
      end
    end
  end
end

