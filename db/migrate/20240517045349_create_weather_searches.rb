class CreateWeatherSearches < ActiveRecord::Migration[7.1]
  def change
    create_table :weather_searches do |t|
      t.string :city
      t.string :state
      t.string :country
      t.integer :zip
      t.float :temp_f
      t.float :temp_min_f
      t.float :temp_max_f

      t.timestamps
    end
  end
end
