class AddAvatarToMyps < ActiveRecord::Migration
  def change
    add_column :myps, :avatar, :string
  end
end
