class User < ActiveRecord::Base
validates :email, uniqueness: { case_sensitive: false }
validates :phone, format: { with: /\d/, message: "only allows numbers."}

    has_many :pets
    belongs_to :account
end