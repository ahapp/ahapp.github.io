class CreateAhas < ActiveRecord::Migration
  def change
    create_table :ahas do |t|
      t.belongs_to :location
      t.string :title
      t.string :body

      t.timestamps
    end
  end
end
