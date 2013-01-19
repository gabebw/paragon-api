require 'bundler/setup'
require 'sinatra'
require 'json'

require './lib/gravatar'
require './lib/google_image'
require './lib/person'

get '/' do
  if params.empty?
    "Try /?gabe=gabe@thoughtbot.com,gabe@other_email.com"
  else
    person_hash = {}

    params.each do |identifier, identifier_hash|
      emails = (identifier_hash['emails'] || '').split(',')
      name = identifier_hash['name']
      person = Person.new(name, emails)

      person_hash[identifier] = person.urls
    end

    JSON.dump(person_hash)
  end
end
