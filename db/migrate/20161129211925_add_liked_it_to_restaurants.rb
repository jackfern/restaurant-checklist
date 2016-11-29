class AddLikedItToRestaurants < ActiveRecord::Migration[5.0]
  def change
    add_column :restaurants, :liked_it, :boolean
  end
end
