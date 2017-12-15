class AddDataToMyps < ActiveRecord::Migration
  def change
    add_column :myps, :data, :datetime
  end
end
