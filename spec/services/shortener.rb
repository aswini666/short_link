require "rails_helper"

RSpec.describe Shortener do
  it "shortens the given url up to 7 characters" do
    url = "https://www.favouritewebsite.com/how-to-do-things/demo"
    shortening = Shortener.new(url)
    expect(shortening.look_up.length).to eq(7)
  end
  
  it "expects every shortening has its own look_up" do
     url = "https://www.facebpook.com/ho-to-see/clear"
     shortening = Shortener.new(url)
     code1 = shortening.look_up

    url = "https://www.facebpook.com/ho-to-see/clear12"
     shortening = Shortener.new(url)
     code2 = shortening.look_up

     expect(code1).not_to eq(code2)

     puts code1.inspect
     puts code2.inspect
  end

   it "expects same if the urls are same" do
     url = "https://www.facebpook.com/ho-to-see/clear"
     shortening = Shortener.new(url)
     code1 = shortening.look_up

    url = "https://www.facebpook.com/ho-to-see/clear"
     shortening = Shortener.new(url)
     code2 = shortening.look_up

     expect(code1).to eq(code2)

     puts code1.inspect
     puts code2.inspect
  end

end