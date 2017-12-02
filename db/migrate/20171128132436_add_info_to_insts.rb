class AddInfoToInsts < ActiveRecord::Migration
  def change
    add_column :insts, :info, :text
  end
end
