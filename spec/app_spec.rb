require 'spec_helper'

describe 'GET /' do
  it 'gives a helpful message with no parameters' do
    get '/'

    last_response.body.should include 'Try /?gabe[emails]=gabe@thoughtbot.com&gabe[name]=Gabe+Berke-Williams'
  end

  it 'includes Gravatars if an email is given' do
    get '/?gabe[emails]=gabe@thoughtbot.com,gabe@example.com&jim[emails]=jim@example.com'

    body = JSON.load(last_response.body)

    body['gabe'].size.should == 2
    body['jim'].size.should == 1
  end

  it 'includes 3 Google Image Search results if a name is given' do
    stub_gis_to_return('Gabe Berke-Williams', %w(one two three))

    get '/?gabe[name]=Gabe+Berke-Williams'
    body = JSON.load(last_response.body)

    body['gabe'].size.should == 3
  end

  it 'returns Gravatar URLs that 404 if no Gravatar exists' do
    get '/?gabe[emails]=gabe@thoughtbot.com'

    JSON.load(last_response.body)['gabe'].first.should =~ /d=404/
  end

  it 'returns Gravatar URLs that are 150px wide and tall' do
    get '/?gabe[emails]=gabe@thoughtbot.com'

    JSON.load(last_response.body)['gabe'].first.should =~ /s=150/
  end
end
