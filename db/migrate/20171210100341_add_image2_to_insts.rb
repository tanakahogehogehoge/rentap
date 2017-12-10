class AddImage2ToInsts < ActiveRecord::Migration
  def change
    add_column :insts, :image2, :string
  end
end
