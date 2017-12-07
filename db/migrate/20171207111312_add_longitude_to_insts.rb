class AddLongitudeToInsts < ActiveRecord::Migration
  def change
    add_column :insts, :longitude, :float
  end
end
