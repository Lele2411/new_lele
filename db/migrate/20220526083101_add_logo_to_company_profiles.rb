class AddLogoToCompanyProfiles < ActiveRecord::Migration[6.0]
  def change
    add_column :company_profiles, :logo, :string, null: false
  end
end
