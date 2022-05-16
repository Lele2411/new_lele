class Company < ApplicationRecord

    ROLES = {
        :role_admin => 1,
        :role_company_admin => 2,
        :role_user => 3,
    }

    scope :order_by_created_at, -> { order('created_at': 'DESC') }

    validates :company_code, presence: { message: "Company code must not be empty!" },
        length: { is: 6, message: "Company code must have 6 characters!" },
        uniqueness: { case_sensitive: false, message: "Company code must be unique!" }

    validates :company_name, presence: { message: "Company name must not be empty!" },
        length: { maximum: 256, too_long: "%{count} characters is the maximum allowed!" }

    validates :company_email, presence: { message: "Company email must not be empty!" },
        format: { with: /\A[\w+\-.]{2,}@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i, message: "Company email must be correct format!" },
        length: { maximum: 256, too_long: "%{count} characters is the maximum allowed!" }

    validates :phone_number, presence: { message: "Phone number must not be empty!" },
        numericality: { message: "Phone number must be numberic!" },
        length: { in: 10..11, too_long: "%{count} characters is the maximum allowed!", too_short: "%{count} characters is the minimum allowed!" }

    validates :address, presence: { message: "Address must not be empty!" },
        length: { maximum: 256, too_long: "%{count} characters is the maximum allowed!" }

    validates :website_url, length: { maximum: 256, too_long: "%{count} characters is the maximum allowed!" }

    validates :logo, presence: { message: "Logo must not be empty!" }

    mount_uploader :logo, ImageUploader
end
