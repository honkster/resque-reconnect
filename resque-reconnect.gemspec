# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require 'resque-reconnect/version'

Gem::Specification.new do |s|
  s.name        = "resque-reconnect"
  s.version     = ResqueReconnect::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Brian Takita"]
  s.email       = ["brian@honk.com"]
  s.homepage    = "http://github.com/honkster/resque-reconnect"
  s.summary     = "Ruby cache methods built on top of Rails and Sinatra caching."
  s.description = "Ruby cache methods built on top of Rails and Sinatra caching."

  s.required_rubygems_version = ">= 1.3.6"

  s.add_development_dependency "rspec"

  s.files        = Dir.glob("{bin,lib}/**/*") + %w(LICENSE README.md)
  s.require_path = 'lib'
end
