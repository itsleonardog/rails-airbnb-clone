class AddNotNullConstraintToUserIdInAccommodations < ActiveRecord::Migration[7.0]
  def change
    change_column_null :accommodations, :user_id, false
  end
end
