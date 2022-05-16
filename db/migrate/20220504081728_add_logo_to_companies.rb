class AddLogoToCompanies < ActiveRecord::Migration[6.0]
  def change
    add_column :companies, :logo, :string, null: false
  end
end
