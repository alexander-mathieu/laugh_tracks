require 'rails_helper'

RSpec.describe Special, type: :model do
  describe "relationships" do
    it {should belong_to(:comedian)}
  end

  describe "validations" do
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:runtime_mins)}
  end

  describe "class methods" do
    before(:each) do
      @comedian_1 = Comedian.create(name: "Kevin Hart", age: 39, birthplace: "Philadelphia, PA", image_url: "http://www.philly.com/resizer/bHw4bvIexfBozzYo6gSgV1vpEXk=/1400x932/center/middle/arc-anglerfish-arc2-prod-pmn.s3.amazonaws.com/public/DBTWGCGWV5C7ZJBACNCBPOCUWE.jpg")

      @comedian_2 = Comedian.create(name: "Dave Chappelle", age: 45, birthplace: "Washington, D.C.", image_url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTII3JGyHZiZx-tRsKYcDk8jotJ6kK6yGNiCof1mLfTw5DxekFZtg")

      @special_1a = @comedian_1.specials.create(name: "I'm a Grown Little Man", runtime_mins: 72)
      @special_2a = @comedian_1.specials.create(name: "Laugh at My Pain", runtime_mins: 89)
      @special_3a = @comedian_1.specials.create(name: "Let Me Explain", runtime_mins: 75)

      @special_1b = @comedian_2.specials.create(name: "Killin' Them Softly", runtime_mins: 57)
      @special_2b = @comedian_2.specials.create(name: "For What It's Worth", runtime_mins: 60)
      @special_3b = @comedian_2.specials.create(name: "Equanimity", runtime_mins: 60)
    end

    it "#total_specials" do
      expect(Special.total_specials).to eq(6)
    end

    it "#average_runtime" do
      expect(Special.average_runtime.to_i).to eq(68)
    end

    it "#find_by_age" do
      expect(Special.find_by_age(39).count).to eq(3)
    end
  end
end
