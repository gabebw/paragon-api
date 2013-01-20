require 'flickraw'

FlickRaw.api_key = ENV['FLICKR_KEY']
FlickRaw.shared_secret = ENV['FLICKR_SECRET']

class Flickr
  def initialize(name)
    @tag = name.downcase.gsub(' ', '')
  end

  def urls
    flickr_results.map do |flickr_result|
      FlickRaw.url_q(flickr_result)
    end
  end

  private

  def flickr_results
    flickr.photos.search(tags: @tag, per_page: 3, page: 1)
  end
end
