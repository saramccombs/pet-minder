class Account < ActiveRecord::Base
    has_secure_password

    validates :username, presence: { message: "is required." }
    validates :username, uniqueness: { case_sensitive: false, message: "is already taken, please try again." }

    has_one :user
end