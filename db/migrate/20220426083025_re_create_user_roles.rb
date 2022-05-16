class ReCreateUserRoles < ActiveRecord::Migration[6.0]
  def change
    create_table :user_roles
    add_reference :user_roles, :role, null: false, foreign_key: true
  end
end
