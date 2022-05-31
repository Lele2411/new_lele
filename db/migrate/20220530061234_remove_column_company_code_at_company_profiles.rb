class RemoveColumnCompanyCodeAtCompanyProfiles < ActiveRecord::Migration[6.0]
  def change
    remove_column :company_profiles, :company_code
  end
end
