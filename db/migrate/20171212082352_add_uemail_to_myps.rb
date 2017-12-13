class AddUemailToMyps < ActiveRecord::Migration
  def change
    add_column :myps, :uemail, :string
  end
end
