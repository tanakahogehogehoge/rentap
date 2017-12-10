class AddImage3ToInsts < ActiveRecord::Migration
  def change
    add_column :insts, :image3, :string
  end
end
