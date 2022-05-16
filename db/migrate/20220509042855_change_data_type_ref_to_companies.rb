class ChangeDataTypeRefToCompanies < ActiveRecord::Migration[6.0]
  def change
    change_column :companies, :company_name, :text, null: false
    change_column :companies, :address, :text, null: false
    change_column :companies, :website_url, :text
    change_column :companies, :logo, :text, null: false
  end
end
