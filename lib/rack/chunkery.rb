module Rack
  # Middleware Class for chunked transfer-encoding
  class Chunker
    def initialize(app, options = {})
      @app = app
    end

    def call(env)
      @app.call env
    end
  end
end

