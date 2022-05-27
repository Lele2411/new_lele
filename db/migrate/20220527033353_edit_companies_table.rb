class EditCompaniesTable < ActiveRecord::Migration[6.0]
  def change
    remove_column :companies, :company_name
    remove_column :companies, :company_email
    remove_column :companies, :phone_number
    remove_column :companies, :status
    remove_column :companies, :website_url
    remove_column :companies, :address
    remove_column :companies, :logo
    remove_column :companies, :created_at
    remove_column :companies, :updated_at
  end
end
