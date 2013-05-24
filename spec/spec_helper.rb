# encoding: utf-8
require 'rubygems'
require 'spork'

require 'simplecov'
SimpleCov.start do
  add_filter '/spec/'
end

Spork.prefork do
  require 'rspec'
  require 'rack/test'
  require 'webmock/rspec'

  RSpec.configure do |config|
    config.treat_symbols_as_metadata_keys_with_true_values = true
    config.run_all_when_everything_filtered = true
    config.filter_run :focus
    config.order = 'random'
    config.include Rack::Test::Methods
    config.include WebMock::API
  end
end

Spork.each_run do
  require 'omniauth-sfdc-background'
  Dir['./spec/support/**/*.rb'].sort.each { |f| require f }
end
