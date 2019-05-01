require 'rails_helper'

describe "as a user on the comedian index" do
  describe "when I see a comedian box" do
    it "displays all comedian specials" do
      comedian_1 = Comedian.create(name: "Kevin Hart", age: 39, birthplace: "Philadelphia, PA", image_url: "http://www.philly.com/resizer/bHw4bvIexfBozzYo6gSgV1vpEXk=/1400x932/center/middle/arc-anglerfish-arc2-prod-pmn.s3.amazonaws.com/public/DBTWGCGWV5C7ZJBACNCBPOCUWE.jpg")
      comedian_2 = Comedian.create(name: "Dave Chappelle", age: 45, birthplace: "Washington, D.C.", image_url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTII3JGyHZiZx-tRsKYcDk8jotJ6kK6yGNiCof1mLfTw5DxekFZtg")

      special_1a = comedian_1.specials.create!(name: "Live in NY!", runtime_mins: 60, image_url: "https://www.images.funny_people/1a")
      special_2a = comedian_1.specials.create!(name: "Live in Boston!", runtime_mins: 60, image_url: "https://www.images.funny_people/2a")
      special_3a = comedian_1.specials.create!(name: "Live in Chitown!", runtime_mins: 60, image_url: "https://www.images.funny_people/3a")

      special_1b = comedian_2.specials.create!(name: "Live in Pelham, AL!", runtime_mins: 60, image_url: "https://www.images.funny_people/1b")
      special_2b = comedian_2.specials.create!(name: "Live in Pelham, NH!", runtime_mins: 60, image_url: "https://www.images.funny_people/2b")
      special_3b = comedian_2.specials.create!(name: "Live in Pelham, GA!", runtime_mins: 60, image_url: "https://www.images.funny_people/3b")

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
