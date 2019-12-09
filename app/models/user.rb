class User < ActiveRecord::Base
    has_many :pets
    belongs_to :account
end