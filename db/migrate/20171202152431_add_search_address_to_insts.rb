class AddSearchAddressToInsts < ActiveRecord::Migration
  def change
    add_column :insts, :searchaddress, :string
  end
end
