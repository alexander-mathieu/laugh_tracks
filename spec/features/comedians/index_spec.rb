require 'rails_helper'

RSpec.describe "as a user" do
  describe "when I visit /comedians" do
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

    it "it displays all comedians within their own box" do
      visit('/comedians')

      within("#comedian-#{@comedian_1.id}") do
        expect(page).to have_content(@comedian_1.name)
        expect(page).to have_content(@comedian_1.age)
        expect(page).to have_content(@comedian_1.birthplace)
      end

      within("#comedian-#{@comedian_2.id}") do
        expect(page).to have_content(@comedian_2.name)
        expect(page).to have_content(@comedian_2.age)
        expect(page).to have_content(@comedian_2.birthplace)
      end
    end

    it "it displays all comedian images within their respective boxes" do
      visit('/comedians')

      within("#comedian-#{@comedian_1.id}") do
        expect(page).to have_css("img[src='#{@comedian_1.image_url}']")
      end

      within("#comedian-#{@comedian_2.id}") do
        expect(page).to have_css("img[src='#{@comedian_2.image_url}']")
      end
    end

    it "it displays all comedian specials within their respective boxes" do
      visit('/comedians')

      within("#comedian-#{@comedian_1.id}") do
        expect(page).to have_content(@special_1a.name)
        expect(page).to have_content(@special_2a.name)
        expect(page).to have_content(@special_3a.name)
        expect(page).to have_content(@special_1a.runtime_mins)
        expect(page).to have_content(@special_2a.runtime_mins)
        expect(page).to have_content(@special_3a.runtime_mins)
      end

      within("#comedian-#{@comedian_2.id}") do
        expect(page).to have_content(@special_1b.name)
        expect(page).to have_content(@special_2b.name)
        expect(page).to have_content(@special_3b.name)
        expect(page).to have_content(@special_1b.runtime_mins)
        expect(page).to have_content(@special_2b.runtime_mins)
        expect(page).to have_content(@special_3b.runtime_mins)
      end
    end

    it "it displays each comedian's name as a link" do
      visit('/comedians')

      within("#comedian-#{@comedian_1.id}") do
        expect(page).to have_link(@comedian_1.name)
      end

      within("#comedian-#{@comedian_2.id}") do
        expect(page).to have_link(@comedian_2.name)
      end
    end

    it "it displays a count of all comedian specials within their respective boxes" do
      visit('/comedians')

      within("#comedian-#{@comedian_1.id}") do
        expect(page).to have_content("Total Specials: #{@comedian_1.specials.count}")
      end

      within("#comedian-#{@comedian_2.id}") do
        expect(page).to have_content("Total Specials: #{@comedian_2.specials.count}")
      end
    end

    it "it displays a box at the top of the page called 'Statistics'" do
      visit('/comedians')

      total_specials  = Special.all.count
      average_runtime = Special.average(:runtime_mins).to_i
      average_age     = Comedian.average(:age).to_i

      within("#statistics") do
        expect(page).to have_content("Statistics")
        expect(page).to have_content("Total Specials: #{total_specials}")
        expect(page).to have_content("Average Special Runtime: #{average_runtime} minutes")
        expect(page).to have_content("Average Comedian Age: #{average_age}")
        expect(page).to have_content("#{@comedian_1.birthplace}")
        expect(page).to have_content("#{@comedian_2.birthplace}")
      end
    end

    describe "and click the link to create a new comedian" do
      it "I'm able to navigate to the new comedian page" do
        visit('/comedians')

        click_link("Click here to add yourself to the list!")

        expect(current_path).to eq('/comedians/new')
      end
    end

    describe "and click on a comedian name" do
      it "I'm able to navigate to a comedian's page" do
        visit('/comedians')

        click_link(@comedian_1.name)

        expect(current_path).to eq("/comedians/#{@comedian_1.id}")
      end
    end

    describe "and add the query /comedians?age=39" do
      it "it displays only comedians that match that age criteria" do
        visit('/comedians?age=39')

        expect(page).to have_content(@comedian_1.name)
        expect(page).to_not have_content(@comedian_2.name)
      end
    end

      it "it displays only statistics for comedians that match that age criteria" do
        visit('/comedians?age=39')

        within("#statistics") do
          expect(page).to have_content("Statistics")
          expect(page).to have_content("Total Specials: 3")
          expect(page).to have_content("Average Special Runtime: 78")
          expect(page).to have_content("Average Comedian Age: 39")
          expect(page).to have_content("#{@comedian_1.birthplace}")
          expect(page).to_not have_content("#{@comedian_2.birthplace}")
        end
      end

    describe "and add the query /comedians?sort=parameter" do
      before(:each) do
        @comedian_3 = Comedian.create(name: "Theo Von", age: 38, birthplace: "Mandeville, LA", image_url: "https://uproxx.files.wordpress.com/2016/02/theo-von-no-offense-feature.jpg?quality=95")
      end

      it "it displays comedians in alphabetical order by name" do
        visit('/comedians?sort=name')

        expect(@comedian_2.name).to appear_before(@comedian_1.name)
        expect(@comedian_1.name).to appear_before(@comedian_3.name)
      end

      it "it displays comedians in alphabetical order by birthplace" do
        visit('/comedians?sort=birthplace')

        expect(@comedian_3.name).to appear_before(@comedian_1.name)
        expect(@comedian_1.name).to appear_before(@comedian_2.name)
      end

      it "it displays comedians from youngest to oldest" do
        visit('/comedians?sort=age')

        expect(@comedian_3.name).to appear_before(@comedian_1.name)
        expect(@comedian_1.name).to appear_before(@comedian_2.name)
      end
    end
  end
end
