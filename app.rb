require 'bundler/setup'
require 'sinatra'
require 'json'

require './lib/gravatar'
require './lib/google_image'
require './lib/person'

get '/' do
  if params.empty?
    'Try /?emails=gabe@thoughtbot.com&name=Gabe+Berke-Williams'
  else
    name = params['name']
    emails = (params['emails'] || '').split(',')
    person = Person.new(name, emails)

    JSON.dump(person.urls)
  end
end
