class AddApplyIdToMyps < ActiveRecord::Migration
  def change
    add_column :myps, :applyid, :integer
  end
end
