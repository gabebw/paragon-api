require 'open-uri'

class GoogleImage
  URL = 'https://ajax.googleapis.com/ajax/services/search/images?v=1.0&safe=active&rsz=3&q='

  def initialize(name)
    escaped_name = URI.escape(name)
    @response = JSON.load(open(URL + escaped_name))
  end

  def urls
    @response['responseData']['results'].map { |result| result['url'] }
  end
end
