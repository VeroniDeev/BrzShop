class Category < ApplicationRecord
  has_many :coupons
  has_many :products
end
