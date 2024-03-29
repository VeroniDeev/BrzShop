class Product < ApplicationRecord
  belongs_to :category

  validates :name, uniqueness: true

  has_many :reviews
  has_many :carts
  has_many :commands
end
