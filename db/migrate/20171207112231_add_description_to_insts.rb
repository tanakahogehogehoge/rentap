class AddDescriptionToInsts < ActiveRecord::Migration
  def change
    add_column :insts, :description, :string
  end
end
