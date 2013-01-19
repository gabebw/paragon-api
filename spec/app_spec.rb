require 'spec_helper'

describe 'GET /' do
  it 'gives a helpful message with no parameters' do
    get '/'

    last_response.body.should include 'Try /?emails=gabe@thoughtbot.com&name=Gabe+Berke-Williams'
  end

  it 'includes Gravatars if an email is given' do
    get '/', emails: 'gabe@thoughtbot.com,gabe@example.com'

    body = JSON.load(last_response.body)

    body.all? { |gravatar_url| gravatar_url.include?('gravatar.com') }.should be_true
  end

  it 'includes 3 Google Image Search results if a name is given' do
    stub_gis_to_return('Gabe Berke-Williams', %w(one two three))

    get '/', name: 'Gabe+Berke-Williams'
    body = JSON.load(last_response.body)

    body.should == %w(one two three)
  end

  it 'returns Gravatar URLs that 404 if no Gravatar exists' do
    get '/', emails: 'gabe@thoughtbot.com'

    JSON.load(last_response.body).first.should =~ /d=404/
  end

  it 'returns Gravatar URLs that are 150px wide and tall' do
    get '/', emails: 'gabe@thoughtbot.com'

    JSON.load(last_response.body).first.should =~ /s=150/
  end
end
