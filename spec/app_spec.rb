require 'spec_helper'

describe 'GET /' do
  it 'gives a helpful message with no parameters' do
    get '/'

    last_response.body.should include 'Try /?gabe=gabe@thoughtbot.com'
  end

  it 'returns emails scoped to names if paramters are given' do
    get '/?gabe=gabe@thoughtbot.com,gabe@example.com&jim=jim@example.com'

    body = JSON.load(last_response.body)

    body['gabe'].size.should == 2
    body['jim'].size.should == 1
  end

  it 'returns URLs that 404 if no Gravatar exists' do
    get '/?gabe=gabe@thoughtbot.com'

    JSON.load(last_response.body)['gabe'].first.should =~ /d=404/
  end

  it 'returns URLs that are 150px wide and tall' do
    get '/?gabe=gabe@thoughtbot.com'

    JSON.load(last_response.body)['gabe'].first.should =~ /s=150/
  end
end
