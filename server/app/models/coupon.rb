class Coupon < ApplicationRecord
  belongs_to :category

  validates :code, uniqueness: true
end
