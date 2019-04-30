class CreateSpecial < ActiveRecord::Migration[5.1]
  def change
    create_table :specials do |t|
      t.string :name
      t.time :runtime
      t.integer :comedian_id
    end
  end
end
