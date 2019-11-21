require 'yaml'
module Rack
  # Middleware Class for chunked transfer-encoding
  class Chunkery
    def initialize(app, options = {})
      @app = app
    end

    def call(env)
      req = Rack::Request.new(env)
      return @app.call env if req.has_header?('HTTP_CONTENT_LENGTH')
      # puts req.to_yaml
      # puts 'PATCH!' if patch?(env)
      # puts 'CHUNKERY!' if chunked?(env)
      new_body = parse(req.body)
      req.set_header('HTTP_CONTENT_LENGTH', new_body[:length])
      req.set_header('RACK_INPUT', new_body[:body])
      @app.call env
    end

    def request_headers(env)
      env.select { |key, value| key.include?('HTTP_') }
    end

    # def patch?(env)
    #   env['REQUEST_METHOD'] == 'PATCH'
    # end

    def parse(body)
      body_array = body.read.split("\r\n")
      new_body = StringIO.new
      body_array.each { |a| new_body.puts a }
      l = new_body.length
      new_body.rewind
      { length: l, body: new_body }
    end
  end
end
