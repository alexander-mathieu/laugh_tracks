class Comedian < ApplicationRecord

  validates_presence_of :name, :age, :birthplace, :image_url

end
