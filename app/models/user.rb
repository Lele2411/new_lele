class User < ApplicationRecord
    has_secure_password
    validates :email, presence: true, length: { maximum: 256 }, uniqueness: { case_sensitive: false }
    validates :password, presence: true

    has_many :user_roles
end
