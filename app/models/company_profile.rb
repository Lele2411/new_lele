class CompanyProfile < ApplicationRecord
    belongs_to :company

    FLAG_ON = 1
    FLAG_OFF = 0

    scope :display_flag_on, -> { where('display_flag', FLAG_ON)}
    scope :order_by_created_at, -> { order('created_at': 'DESC') }

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
    validates :display_time, presence: { message: "Time to set display must not be empty!" }

    validate :time_to_display_must_be_after_or_equal_to_today

    mount_uploader :logo, ImageUploader

    private
    def time_to_display_must_be_after_or_equal_to_today
        if display_time.present? && display_time < Date.today
            errors.add(:display_time, "Time must be after or equal to today")
        end
    end
end