class AddLatitudeToInsts < ActiveRecord::Migration
  def change
    add_column :insts, :latitude, :float
  end
end
