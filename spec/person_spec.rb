require 'spec_helper'

describe Person, '#urls' do
  it 'returns all possible URLs, with a preference for Gravatars' do
    gravatar_urls = Gravatar.new(['gabe@thoughtbot.com']).urls
    google_image_urls = %w(first_gis second_gis third_gis)
    stub_gis_to_return('Gabe B-W', google_image_urls)
    person = Person.new('Gabe B-W', ['gabe@thoughtbot.com'])

    person.urls.should == gravatar_urls + google_image_urls
  end
end
