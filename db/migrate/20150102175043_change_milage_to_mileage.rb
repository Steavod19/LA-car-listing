class ChangeMilageToMileage < ActiveRecord::Migration
  def change
    rename_column :cars, :milage, :mileage
  end
end
