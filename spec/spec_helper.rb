require "rubygems"
require "spec"
require "spec/autorun"
require "rr"
require "fileutils"

$LOAD_PATH.unshift File.expand_path("#{File.dirname(__FILE__)}/../lib")
require "resque_reconnect"

Spec::Runner.configure do |configuration|
  configuration.mock_with :rr
end
