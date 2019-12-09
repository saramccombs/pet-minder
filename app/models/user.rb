class User < ActiveRecord::Base
validates :email, uniqueness: { case_sensitive: false }

    has_many :pets
    belongs_to :account
end