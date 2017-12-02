class AddAddressToInsts < ActiveRecord::Migration
  def change
    add_column :insts, :address, :string
  end
end
