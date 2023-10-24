class Review < ApplicationRecord
  belongs_to :user
  belongs_to :product


  validates :title, presence: true
  validates :description, presence: true
  validates :star, presence: true

  has_many :who_voteds
end
