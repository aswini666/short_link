class Url < ApplicationRecord
  validates_presence_of :original_url, :look_up
  validates_uniqueness_of :look_up
end
