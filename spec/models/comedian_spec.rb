require 'rails_helper'

RSpec.describe Comedian, type: :model do
  describe "relationships" do
    it {should have_many(:specials)}
  end

  describe "validations" do
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:age)}
    it {should validate_presence_of(:birthplace)}
  end

  describe "instance methods" do
    it ".count" do
      comedian = Comedian.create(name: "Kevin Hart", age: 39, birthplace: "Philadelphia, PA", image_url: "http://www.philly.com/resizer/bHw4bvIexfBozzYo6gSgV1vpEXk=/1400x932/center/middle/arc-anglerfish-arc2-prod-pmn.s3.amazonaws.com/public/DBTWGCGWV5C7ZJBACNCBPOCUWE.jpg")

      comedian.specials.create(name: "I'm a Grown Little Man", runtime_mins: 72)
      comedian.specials.create(name: "Laugh at My Pain", runtime_mins: 89)
      comedian.specials.create(name: "Let Me Explain", runtime_mins: 75)

      expect(comedian.specials_count).to eq(3)
    end
  end

  describe "class methods" do
    before(:each) do
      @comedian_1 = Comedian.create(name: "Kevin Hart", age: 39, birthplace: "Philadelphia, PA", image_url: "http://www.philly.com/resizer/bHw4bvIexfBozzYo6gSgV1vpEXk=/1400x932/center/middle/arc-anglerfish-arc2-prod-pmn.s3.amazonaws.com/public/DBTWGCGWV5C7ZJBACNCBPOCUWE.jpg")

      @comedian_2 = Comedian.create(name: "Dave Chappelle", age: 45, birthplace: "Washington, D.C.", image_url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTII3JGyHZiZx-tRsKYcDk8jotJ6kK6yGNiCof1mLfTw5DxekFZtg")

      @comedian_3 = Comedian.create(name: "Theo Von", age: 38, birthplace: "Mandeville, LA", image_url: "https://uproxx.files.wordpress.com/2016/02/theo-von-no-offense-feature.jpg?quality=95")
    end

    it "#find_by_age" do
      expect(Comedian.find_by_age(39).count).to eq(1)
    end

    it "#average_age" do
      expect(Comedian.average_age.to_i).to eq(40)
    end

    it "#all_birthplaces" do
      expect(Comedian.all_birthplaces).to eq(["Mandeville, LA", "Philadelphia, PA", "Washington, D.C."])
    end

    it "#order_by" do
      expect(Comedian.order_by(:name)).to eq([@comedian_2, @comedian_1, @comedian_3])
      expect(Comedian.order_by(:age)).to eq([@comedian_3, @comedian_1, @comedian_2])
      expect(Comedian.order_by(:birthplace)).to eq([@comedian_3, @comedian_1, @comedian_2])
    end
  end
end
