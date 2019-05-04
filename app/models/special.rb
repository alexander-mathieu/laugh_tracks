class Special < ApplicationRecord
  belongs_to :comedian
  validates_presence_of :name, :runtime_mins

  def self.total_specials
    count
  end

end
