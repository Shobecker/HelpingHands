class Admin < ApplicationRecord
	before_save { self.username = username.downcase }
	has_secure_password
    validates :password, presence: true, length: { minimum: 4 }
    validates :userName, presence: true, length: { maximum: 255},
    				uniqueness: true
end
