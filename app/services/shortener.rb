class Shortener
  attr_reader :url, :url_link

  def initialize(url, url_link = Url)
    @url = url
    @url_link = url_link
  end

  def generate_short_link
    url_link.create(original_url: url, look_up: look_up)
  end

  def look_up
    loop do
      code = get_code
      break code unless url_link.exists?(look_up: code)
    end
  end

  private
  def get_code
    SecureRandom.uuid[0..4]
  end
end