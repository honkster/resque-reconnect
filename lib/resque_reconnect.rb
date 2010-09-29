require "resque"

class ResqueReconnect
  extend(Module.new do
    def reconnect(redis_server)
      Resque.redis = redis_server
    end
  end)

  attr_reader :redis_server_getter
  def initialize(app, redis_server_getter)
    @app = app
    @redis_server_getter = redis_server_getter
  end

  def call(env)
    self.class.reconnect(redis_server)
    @app.call(env)
  end

  def redis_server
    if redis_server_getter.is_a?(Proc)
      redis_server_getter.call
    else
      redis_server_getter
    end
  end
end
