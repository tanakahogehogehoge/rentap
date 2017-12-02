class CreateMyps < ActiveRecord::Migration
  def change
    create_table :myps do |t|
      t.string :uname
      t.string :uaddress
      t.string :ubankaccount

      t.timestamps null: false
    end
  end
end
