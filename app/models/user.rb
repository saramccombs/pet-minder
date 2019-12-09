class User < ActiveRecord::Base
validates :email, uniqueness: { case_sensitive: false }
validates :phone, format: { with: /[1-9]\d{2}-\d{3}-\d{4}/, message: "only allows numbers and must be formatted as 'XXX-XXX-XXXX'."}

    has_many :pets
    belongs_to :account
end