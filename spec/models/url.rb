require "rails_helper"

RSpec.describe Url, type: :model do
   it "is invalid if original url doesnt present" do
    url = Url.new{
       look_up = "1234567"
      }
    url.save   
    expect(url.valid?).to be(false)
  end

  it "is invalid if lookup doesnt present" do
    url = Url.new{
       original_url = "https://www.facebook.com/demo/articles/1234"
      }
    url.save   
    expect(url.valid?).to be(false)
  end

  it "is invalid if it has same look up code" do
    url1 = Url.new{
       original_url = "https://www.facebook.com/demo/articles/1234",
       look_up = "1234567"
      }
    url1.save    

    url2 = Url.new{
       original_url = "https://www.facebook.com/demo/articles/12344",
       look_up = "1234567"
      }
    url2.save
    expect(url2.valid?).to be(false)
  end
end