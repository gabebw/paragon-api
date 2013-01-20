ROOT = Pathname.new(File.join(File.dirname(__FILE__), '..'))

if File.exist?(ROOT.join('.env'))
  File.readlines(ROOT.join('.env')).each do |line|
    key, value = line.strip.split('=')
    ENV[key] = value
  end
else
  puts "! Please create a .env file in the app root with FLICKR_{KEY,SECRET} set"
  exit 1
end

require ROOT.join('app.rb')

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

  config.around(allow_net_connect: true) do |example|
    WebMock.allow_net_connect!
    example.run
    WebMock.disable_net_connect!
  end
end
