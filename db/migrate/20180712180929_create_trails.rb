class CreateTrails < ActiveRecord::Migration[5.2]
  def change
    create_table :trails do |t|
      t.string :name
      t.text :description
      t.float :latitude
      t.float :longitude
      t.integer :difficulty
      t.integer :direction

      t.timestamps
    end
  end
end
