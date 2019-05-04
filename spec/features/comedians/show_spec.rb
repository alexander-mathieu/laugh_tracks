require 'rails_helper'

RSpec.describe "as a user" do
  describe "when I visit /comedians/:id" do
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

    it "it displays information about a single comedian" do
      visit("/comedians/#{@comedian_1.id}")

      expect(page).to have_content(@comedian_1.name)
      expect(page).to have_content(@comedian_1.age)
      expect(page).to have_content(@comedian_1.birthplace)
      expect(page).to have_content(@special_1a.name)
      expect(page).to have_content(@special_2a.name)
      expect(page).to have_content(@special_3a.name)
      expect(page).to have_content(@special_1a.runtime_mins)
      expect(page).to have_content(@special_2a.runtime_mins)
      expect(page).to have_content(@special_3a.runtime_mins)

      expect(page).to_not have_content(@comedian_2.name)
      expect(page).to_not have_content(@comedian_2.age)
      expect(page).to_not have_content(@comedian_2.birthplace)
      expect(page).to_not have_content(@special_1b.name)
      expect(page).to_not have_content(@special_2b.name)
      expect(page).to_not have_content(@special_3b.name)
      expect(page).to_not have_content(@special_1b.runtime_mins)
      expect(page).to_not have_content(@special_2b.runtime_mins)
      expect(page).to_not have_content(@special_3b.runtime_mins)
    end

    it "it allows me to navigate back to /comedians" do
      visit("/comedians/#{@comedian_1.id}")

      click_on('<< Back to All Comedians')

      expect(current_path).to eq('/comedians')
    end
  end
end
