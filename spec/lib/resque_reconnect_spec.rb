require File.expand_path("#{File.dirname(__FILE__)}/../spec_helper")

describe ResqueReconnect do
  describe ".call" do
    it "sets Resque.redis= to the return value of the block passed to .server and calls app" do
      mock.strong(Resque).redis=("return-value")
      ResqueReconnect.server do
        "return-value"
      end

      app = Object.new
      env = {}
      mock(app).call(env)
      ResqueReconnect.new(app).call(env)
    end
  end
end