class Comedian < ApplicationRecord
  has_many :specials
  validates_presence_of :name, :age, :birthplace, :image_url

  def self.find_by_age(age)
    where({age: age})
  end

end
