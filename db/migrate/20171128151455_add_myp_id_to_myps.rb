class AddMypIdToMyps < ActiveRecord::Migration
  def change
    add_column :myps, :mypid, :integer
  end
end
