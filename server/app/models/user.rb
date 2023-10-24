class User < ApplicationRecord
  has_secure_password

  validates :name, presence: true
  validates :surname, presence: true
  validates :phone, uniqueness: true, presence: true
  validates :mail, uniqueness: true, presence: true, format: { with: /\A[^@\s]+@[^@\s]+\z/ }
  validates :country, presence: true
  validates :adresse, presence: true
  validates :postal, presence: true

  has_many :carts
  has_many :commands
  has_many :reviews
  has_many :who_voteds
end
