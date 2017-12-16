class AddStarttimeToMyps < ActiveRecord::Migration
  def change
    add_column :myps, :starttime, :time
  end
end
