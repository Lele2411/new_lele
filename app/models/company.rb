class Company < ApplicationRecord
    # before_save :set_display_flag_on_for_company

    ROLES = {
        :role_admin => 1,
        :role_company_admin => 2,
        :role_user => 3,
    }

    validates :company_code, presence: { message: "Company code must not be empty!" },
        length: { is: 6, message: "Company code must have 6 characters!" },
        uniqueness: { case_sensitive: false, message: "Company code must be unique!" }

    has_many :company_profiles, dependent: :destroy

    accepts_nested_attributes_for :company_profiles


    # private
    # def set_display_flag_on_for_company
    #     self.display_flag = Company::FLAG_ON
    # end
end
