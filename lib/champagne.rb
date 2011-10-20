require "champagne/version"

module Champagne
  # Open up a connecton to console and stream the output. When the process is killed, 
  # we shut down the stream.
  class Console < EventMachine::Connection
    attr_accessor :stream

    def initialize(stream)
      @stream = stream
    end

    def receive_data(data)
      stream << data
    end

    def unbind
      stream.close
    end

    def self.exec(cmd, stream)
      EM.popen cmd, self, stream
    end
  end

  require 'sinatra/base'

  class App < Sinatra::Base
    get '/' do
      stream(:keep_open) do |out|
        Console.exec "sh -c 'ls -al'", out
      end
    end
  end
end