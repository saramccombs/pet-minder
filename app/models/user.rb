class User < ActiveRecord::Base
    has_many :pets
    has_one :account
end