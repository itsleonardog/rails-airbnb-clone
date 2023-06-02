class AddImageUrlToAccommodations < ActiveRecord::Migration[7.0]
  def change
    add_column :accommodations, :image_url_string, :string
  end
end
