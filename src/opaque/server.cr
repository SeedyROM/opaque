require "socket"

module Opaque
  class ServerConfig
    @@HOST_DEFAULT : String = "localhost"
    @@PORT_DEFAULT : UInt16 = 12480

    getter host : String
    getter port : UInt16

    def initialize(@host = @@HOST_DEFAULT, @port = @@PORT_DEFAULT) end
  end

  class Server
    include Injector
    inject :logger

    getter tcp : TCPServer

    def initialize(*config)
      @config = ServerConfig.new(*config)
      @tcp = TCPServer.new(@config.host, @config.port)
    end

    private def handle_connection(client : TCPSocket)
      loop do
        message = client.gets()
        if message == "quit"
          client.close()
          break
        end
        client.puts(message)
      end
    end

    def listen
      logger.info("🚀  Started opaque at #{@config.host}:#{@config.port}...")
      while client = @tcp.accept?
        handle_connection(client)
      end
    end
  end
end

