require 'bundler/setup'
require 'sinatra'
require 'json'

require './gravatar'

get '/' do
  if params.empty?
    "Try /?gabe=gabe@thoughtbot.com,gabe@other_email.com"
  else
    emails_by_name = {}
    params.each do |name, emails_separated_by_commas|
      emails = emails_separated_by_commas.split(',')
      emails_by_name[name] = Gravatar.new(emails).urls
    end

    JSON.dump(emails_by_name)
  end
end
