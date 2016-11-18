class AddAteAtToRestaurants < ActiveRecord::Migration[5.0]
  def change
    add_column :restaurants, :ate_at, :datetime
  end
end
