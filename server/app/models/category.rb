class Category < ApplicationRecord
  has_many :coupons
  has_many :products

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
end
