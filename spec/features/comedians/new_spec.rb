require 'rails_helper'

RSpec.describe "as a user" do
  describe "when I visit /comedians/new" do
    it "it displays a form to create a new comedian" do
      visit '/comedians/new'

      expect(page).to have_content("Name")
      expect(page).to have_content("Age")
      expect(page).to have_content("Birthplace")
    end
  end
end

# fill_in "Name", with: "The Joker"
# fill_in "Age", with: "???"
# fill_in "Birthplace", with: "Gotham City"
# click_on "Create Comedian"
