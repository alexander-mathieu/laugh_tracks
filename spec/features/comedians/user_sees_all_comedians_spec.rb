require 'rails_helper'

describe "user sees all comedians" do
  describe "they visit /comedians" do
    it "displays all comedians" do
      comedian_1 = Comedian.create(name: "Kevin Hart", age: 39, birthplace: "Philadelphia, PA", image_url: "http://www.philly.com/resizer/bHw4bvIexfBozzYo6gSgV1vpEXk=/1400x932/center/middle/arc-anglerfish-arc2-prod-pmn.s3.amazonaws.com/public/DBTWGCGWV5C7ZJBACNCBPOCUWE.jpg")
      comedian_2 = Comedian.create(name: "Dave Chappelle", age: 45, birthplace: "Washington, D.C.", image_url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTII3JGyHZiZx-tRsKYcDk8jotJ6kK6yGNiCof1mLfTw5DxekFZtg")

      visit '/comedians'

      expect(page).to have_content(comedian_1.name)
      expect(page).to have_content(comedian_1.age)
      expect(page).to have_content(comedian_1.birthplace)
      expect(page).to have_content(comedian_2.name)
      expect(page).to have_content(comedian_2.age)
      expect(page).to have_content(comedian_2.birthplace)
    end
  end
end
