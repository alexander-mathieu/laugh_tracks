class RemoveImageUrlFromSpecials < ActiveRecord::Migration[5.1]
  def change
    remove_column :specials, :image_url, :string
  end
end
