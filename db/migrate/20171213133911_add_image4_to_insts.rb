class AddImage4ToInsts < ActiveRecord::Migration
  def change
    add_column :insts, :image4, :string
  end
end
