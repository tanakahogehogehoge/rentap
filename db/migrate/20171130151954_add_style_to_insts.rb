class AddStyleToInsts < ActiveRecord::Migration
  def change
    add_column :insts, :style, :string
  end
end
