require File.join(File.dirname(__FILE__), '..', 'app.rb')

require 'sinatra'
require 'rack/test'
require 'webmock'
require 'webmock/rspec'

set :environment, :test
set :run, false
set :raise_errors, true
set :logging, false

def app
  Sinatra::Application
end

WebMock.enable!
WebMock.disable_net_connect!

Dir['spec/support/**/*.rb'].each { |f| require File.expand_path(f) }

RSpec.configure do |config|
  config.include Rack::Test::Methods

  config.before do
    stub_request(:get, 'http://ajax.googleapis.com').to_return(body: 'hi')
  end

  config.around(allow_net_connect: true) do |example|
    WebMock.allow_net_connect!
    example.run
    WebMock.disable_net_connect!
  end
end
