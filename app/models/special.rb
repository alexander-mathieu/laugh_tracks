class Special < ApplicationRecord

  validates_presence_of :name, :runtime, :comedian_id

end
