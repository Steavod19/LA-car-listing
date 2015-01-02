class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.string :manufacturer_id, null: false
      t.string :type, null: false
      t.string :color, null: false
      t.string :year, null: false
      t.integer :mileage, null: false

      t.timestamps
    end
  end
end
