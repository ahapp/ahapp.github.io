class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :city_name
      t.timestamps
    end
  end
end
