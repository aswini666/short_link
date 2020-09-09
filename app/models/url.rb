class Url < ApplicationRecord
  validates :original_url, :look_up, presence: true
  validates_uniqueness_of :look_up
  validate :original_url_format

  def original_url_format
  	uri = URI.parse(original_url || "")
  	if uri.host.nil?
  	 errors.add(:original_url, "Invalid Format")
  	end
  end

  def shortened_url
  	"http://localhost:3000/#{look_up}"
  end
end
