class Shortener
  def initialize(url)
    @url = url
  end

  def look_up
    Digest::SHA256.hexdigest(@url)[0..6]
  end
end