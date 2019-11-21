require 'rack'
require 'rack/server'
require File.expand_path('../../lib/rack/chunkery', __FILE__)

class HelloWorld
  def response(text)
    [ 200, { }, [ text ] ]
  end
end

class SimpleServer
  def self.call(env)
    content_length = env['HTTP_CONTENT_LENGTH']
    HelloWorld.new.response "Content length: #{content_length}"
  end
end

app = Rack::Builder.new do
  use Rack::Chunkery
  use Rack::Chunkery
  run SimpleServer
end

Rack::Server.start :app => app

