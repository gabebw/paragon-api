require 'spec_helper'

describe GoogleImage do
  it 'returns 3 image URLs' do
    GoogleImage::URL.should =~ /rsz=3/
  end

  it 'has safe search turned on' do
    GoogleImage::URL.should =~ /safe=active/
  end

  it 'correctly parses results from Google', allow_net_connect: true do
    GoogleImage.new('thoughtbot').urls.size.should == 3
  end

  it 'URL-encodes the query', allow_net_connect: true do
    GoogleImage.new('space & others').urls.size.should == 3
  end
end
