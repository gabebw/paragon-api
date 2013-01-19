require 'digest/md5'

class Gravatar
  def initialize(emails)
    @hashes = emails.map { |email| hash(email) }
  end

  def urls
    @hashes.map do |hash|
      "http://www.gravatar.com/avatar/#{hash}?d=404&s=150"
    end
  end

  private

  def hash(email)
    Digest::MD5.hexdigest(email.downcase.strip)
  end
end
