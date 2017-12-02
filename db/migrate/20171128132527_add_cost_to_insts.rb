class AddCostToInsts < ActiveRecord::Migration
  def change
    add_column :insts, :cost, :string
  end
end
