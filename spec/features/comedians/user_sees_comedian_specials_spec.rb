require 'rails_helper'

describe "as a user on the comedian index" do
  describe "when I see a comedian box" do
    it "displays all comedian specials" do
      comedian_1 = Comedian.create(name: "Kevin Hart", age: 39, birthplace: "Philadelphia, PA", image_url: "http://www.philly.com/resizer/bHw4bvIexfBozzYo6gSgV1vpEXk=/1400x932/center/middle/arc-anglerfish-arc2-prod-pmn.s3.amazonaws.com/public/DBTWGCGWV5C7ZJBACNCBPOCUWE.jpg")
      comedian_2 = Comedian.create(name: "Dave Chappelle", age: 45, birthplace: "Washington, D.C.", image_url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTII3JGyHZiZx-tRsKYcDk8jotJ6kK6yGNiCof1mLfTw5DxekFZtg")

      special_1a = comedian_1.specials.create(name: "I'm a Grown Little Man", runtime_mins: 72)
      special_2a = comedian_1.specials.create(name: "Laugh at My Pain", runtime_mins: 89)
      special_3a = comedian_1.specials.create(name: "Let Me Explain", runtime_mins: 75)

      special_1b = comedian_2.specials.create(name: "Killin' Them Softly", runtime_mins: 57)
      special_2b = comedian_2.specials.create(name: "For What It's Worth", runtime_mins: 60)
      special_3b = comedian_2.specials.create(name: "Equanimity", runtime_mins: 60)

      visit '/comedians'

      within "#comedian-#{comedian_1.id}" do
        expect(page).to have_content(special_1a.name)
        expect(page).to have_content(special_2a.name)
        expect(page).to have_content(special_3a.name)
        expect(page).to have_content(special_1a.runtime_mins)
        expect(page).to have_content(special_2a.runtime_mins)
        expect(page).to have_content(special_3a.runtime_mins)
      end

      within "#comedian-#{comedian_2.id}" do
        expect(page).to have_content(special_1b.name)
        expect(page).to have_content(special_2b.name)
        expect(page).to have_content(special_3b.name)
        expect(page).to have_content(special_1b.runtime_mins)
        expect(page).to have_content(special_2b.runtime_mins)
        expect(page).to have_content(special_3b.runtime_mins)
      end
    end
  end
end
