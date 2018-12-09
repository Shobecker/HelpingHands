class Job < ApplicationRecord
  belongs_to :customer
  default_scope -> { order(created_at: :desc) }
  validates :customer_id, presence: true
  validates :toAddress, presence: true, length: { maximum: 140 }
  validates :fromAdress, presence: true, length: { maximum: 140 }
  validates :bedrooms, presence: true
end
