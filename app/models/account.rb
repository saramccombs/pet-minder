class Account < ActiveRecord::Base
    has_secure_password

    has_one :user
end