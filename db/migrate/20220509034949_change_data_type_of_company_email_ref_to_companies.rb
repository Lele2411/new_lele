class ChangeDataTypeOfCompanyEmailRefToCompanies < ActiveRecord::Migration[6.0]
  def change
    change_column :companies, :company_email, :text, null: false
  end
end
