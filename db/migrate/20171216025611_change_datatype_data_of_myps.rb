class ChangeDatatypeDataOfMyps < ActiveRecord::Migration
  def change
    change_column :myps, :data, :date
  end
end
