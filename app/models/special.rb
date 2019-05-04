class Special < ApplicationRecord
  belongs_to :comedian
  validates_presence_of :name, :runtime_mins

  def self.total_specials
    count
  end

  def self.average_runtime
    average(:runtime_mins)
  end
end
