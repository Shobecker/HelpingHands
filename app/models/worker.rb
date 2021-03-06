class Worker < ApplicationRecord
	before_save { self.email = email.downcase }
  before_save { self.userName = userName.downcase }
	validates :lastName,  presence: true, length: { maximum: 50 }
  	validates :firstName,  presence: true, length: { maximum: 50 }
  	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  	validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX }
    has_secure_password
    validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
    validates :userName, presence: true, length: { maximum: 255},
    				uniqueness: true
end
