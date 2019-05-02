require 'rails_helper'

describe Comedian, type: :model do

  describe "relationships" do
    it {should have_many(:specials)}
  end

  describe "validations" do
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:age)}
    it {should validate_presence_of(:birthplace)}
  end

  describe "class methods" do
   it '.find_by_age' do
     @comedian_1 = Comedian.create(name: "Kevin Hart", age: 39, birthplace: "Philadelphia, PA", image_url: "http://www.philly.com/resizer/bHw4bvIexfBozzYo6gSgV1vpEXk=/1400x932/center/middle/arc-anglerfish-arc2-prod-pmn.s3.amazonaws.com/public/DBTWGCGWV5C7ZJBACNCBPOCUWE.jpg")

     @comedian_2 = Comedian.create(name: "Dave Chappelle", age: 45, birthplace: "Washington, D.C.", image_url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTII3JGyHZiZx-tRsKYcDk8jotJ6kK6yGNiCof1mLfTw5DxekFZtg")

     expect(Comedian.find_by_age(39).count).to eq(1)
    end
  end
end
