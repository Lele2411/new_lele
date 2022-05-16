class DropUserRoles < ActiveRecord::Migration[6.0]
  def change
    drop_table :user_roles
  end
end
