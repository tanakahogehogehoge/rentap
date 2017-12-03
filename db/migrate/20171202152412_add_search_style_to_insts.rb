class AddSearchStyleToInsts < ActiveRecord::Migration
  def change
    add_column :insts, :searchstyle, :string
  end
end
