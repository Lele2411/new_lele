class ReNameCollumnAtRoles < ActiveRecord::Migration[6.0]
  def change
    rename_column :roles, :type, :role_type
  end
end
