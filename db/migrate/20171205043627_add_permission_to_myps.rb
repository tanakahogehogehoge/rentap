class AddPermissionToMyps < ActiveRecord::Migration
  def change
    add_column :myps, :permission, :integer
  end
end
