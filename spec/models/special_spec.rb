require 'rails_helper'

describe Special, type: :model do
  describe "validations" do
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:runtime_mins)}
    it {should validate_presence_of(:comedian_id)}
    it {should validate_presence_of(:image_url)}
  end

  describe "relationships" do
    it {should belong_to(:comedian)}
  end


end
