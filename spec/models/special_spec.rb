require 'rails_helper'

describe Special, type: :model do
  describe "validations" do
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:runtime)}
    it {should validate_presence_of(:comedian_id)}
  end
end
