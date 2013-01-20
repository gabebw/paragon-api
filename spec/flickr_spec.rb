require 'spec_helper'

describe Flickr do
  it 'searches Flickr', allow_net_connect: true do
    Flickr.new('gabe').urls.all? { |url| url =~ /flickr/ }.should be_true
  end

  it 'returns up to 3 URLs', allow_net_connect: true do
    Flickr.new('gabe').urls.size.should == 3
  end

  it 'returns 150px square photos', allow_net_connect: true do
    Flickr.new('gabe').urls.first.should end_with '_q.jpg'
  end
end
