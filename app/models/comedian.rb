class Comedian < ApplicationRecord
  has_many :specials
  validates_presence_of :name, :age, :birthplace

  def specials_count
    specials.count
  end

  def self.find_by_age(age)
    where({age: age})
  end

  def self.average_age
    average(:age)
  end

  def self.all_birthplaces
    distinct.pluck(:birthplace)
  end

end
