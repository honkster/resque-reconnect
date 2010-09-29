require "resque"

class ResqueReconnect
  extend(Module.new do
    attr_reader :server_lambda
    def server(&block)
      @server_lambda = block
    end

    def reconnect
      Resque.redis = server_lambda.call
    end
  end)

  def initialize(app)
    @app = app
  end

  def call(env)
    self.class.reconnect
    @app.call(env)
  end
end
