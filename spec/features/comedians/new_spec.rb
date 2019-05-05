require 'rails_helper'

RSpec.describe "as a user" do
  describe "when I visit /comedians/new" do
    it "it displays a form to create a new comedian" do
      visit '/comedians/new'

      expect(page).to have_content("Name")
      expect(page).to have_content("Age")
      expect(page).to have_content("Birthplace")
    end

    it "I'm able to create a new comedian and view it on /comedians" do
      visit '/comedians/new'

      fill_in "Name", with: "The Joker"
      fill_in "Age", with: 100
      fill_in "Birthplace", with: "Gotham City"
      click_on "Create Comedian"

      comedian = Comedian.last

      expect(current_path).to eq("/comedians")

      within("#comedian-#{comedian.id}") do
        expect(page).to have_content(comedian.name)
        expect(page).to have_content(comedian.age)
        expect(page).to have_content(comedian.birthplace)
      end
    end

    it "it allows me to navigate back to /comedians" do
      visit('/comedians/new')

      click_on('<< Back to All Comedians')

      expect(current_path).to eq('/comedians')
    end
  end
end
