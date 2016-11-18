class CreateCityLists < ActiveRecord::Migration[5.0]
  def change
    create_table :city_lists do |t|
      t.string :city

      t.timestamps
    end
  end
end
