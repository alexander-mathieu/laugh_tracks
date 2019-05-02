class Comedian < ApplicationRecord
  has_many :specials

  validates_presence_of :name, :age, :birthplace, :image_url
end
