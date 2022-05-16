class ChangeDataTypeOfEmailRefToUsers < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :email, :text, null: false
  end
end
