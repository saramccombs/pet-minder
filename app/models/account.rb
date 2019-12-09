class Account < ActiveRecord::Base
    has_secure_password

    validates :username, presence: { message: "A username is required." }
    validates :username, uniqueness: { message: "That username is already taken, please try again." }

    has_one :user
end