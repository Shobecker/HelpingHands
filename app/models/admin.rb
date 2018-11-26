class Admin < ApplicationRecord
	has_secure_password
    validates :password, presence: true, length: { minimum: 4 }
end
