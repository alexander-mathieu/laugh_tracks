require 'rails_helper'

describe "as a user on the comedian index" do
  describe "when I see a comedian box " do
    it "displays image of comedian" do
      comedian_1 = Comedian.create(name: "Kevin Hart", age: 39, birthplace: "Philadelphia, PA", image_url: "http://www.philly.com/resizer/bHw4bvIexfBozzYo6gSgV1vpEXk=/1400x932/center/middle/arc-anglerfish-arc2-prod-pmn.s3.amazonaws.com/public/DBTWGCGWV5C7ZJBACNCBPOCUWE.jpg")
      comedian_2 = Comedian.create(name: "Dave Chappelle", age: 45, birthplace: "Washington, D.C.", image_url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTII3JGyHZiZx-tRsKYcDk8jotJ6kK6yGNiCof1mLfTw5DxekFZtg")

      visit '/comedians'

      within("#comedian-#{comedian_1.id}") do
        expect(page).to have_css("img[src='#{comedian_1.image_url}']")
      end

      within("#comedian-#{comedian_2.id}") do
        expect(page).to have_css("img[src='#{comedian_2.image_url}']")
      end
    end
  end
end
