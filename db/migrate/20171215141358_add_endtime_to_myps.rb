class AddEndtimeToMyps < ActiveRecord::Migration
  def change
    add_column :myps, :endtime, :time
  end
end
