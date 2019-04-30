class Special < ApplicationRecord
belongs_to :comedian

  validates_presence_of :name, :runtime, :comedian_id

end
