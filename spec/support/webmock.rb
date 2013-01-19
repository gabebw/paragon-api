module WebmockHelpers
  def stub_gis_to_return(query, urls)
    query = URI.encode(query)
    stub_request(:get, "https://ajax.googleapis.com/ajax/services/search/images?q=#{query}&rsz=3&safe=active&v=1.0").
      to_return(body: JSON.dump(responseData: {
          results: urls.map { |url| {url: url} }
        }
      ))
  end
end

RSpec.configure do |config|
  config.include WebmockHelpers
end
