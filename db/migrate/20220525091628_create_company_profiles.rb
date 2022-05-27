class CreateCompanyProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :company_profiles do |t|
        t.string :company_code, null: false
        t.string :company_name, null: false
        t.string :company_email, null: false
        t.string :phone_number, null: false
        t.integer :status, default: 2
        t.string :website_url
        t.string :address, null: false
        t.integer :display_flag, default: 0
        t.datetime :display_time, null: false
        t.timestamps
    end
  end
end
