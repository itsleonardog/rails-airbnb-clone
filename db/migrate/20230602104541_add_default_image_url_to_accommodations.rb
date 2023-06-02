class AddDefaultImageUrlToAccommodations < ActiveRecord::Migration[7.0]
  def change
    add_column :accommodations, :default_image_url, :string
  end
end
