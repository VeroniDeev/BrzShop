class Product < ApplicationRecord
  belongs_to :category

  has_many :reviews
  has_many :carts
  has_many :commands
end
