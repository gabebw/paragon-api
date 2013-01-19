class Person
  def initialize(name, emails)
    @emails = emails
    @name = name
  end

  def urls
    gravatar_urls + google_image_urls
  end

  private

  def gravatar_urls
    if @emails.nil?
      []
    else
      Gravatar.new(@emails).urls
    end
  end

  def google_image_urls
    if @name.nil?
      []
    else
      GoogleImage.new(@name).urls
    end
  end
end
