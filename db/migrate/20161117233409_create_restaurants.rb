class CreateRestaurants < ActiveRecord::Migration[5.0]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :description
      t.string :address
      t.references :city_list, foreign_key: true

      t.timestamps
    end
  end
end
