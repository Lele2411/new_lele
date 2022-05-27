class AddCompanyRefToCompanyProfiles < ActiveRecord::Migration[6.0]
  def change
    add_reference :company_profiles, :company, null: false, foreign_key: true
  end
end
