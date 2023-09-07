class Restaurant < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_one_attached :photo

  CATEGORIES = [
    "fast_food",
    "casual_dining",
    "contemporary",
    "cafes",
    "pizzerias",
    "pop_up",
    "ghost"
  ]

  validates :name, :description, :category, :address, :zipcode, :city, :phone_number, presence: true
  validates :name, uniqueness: true
end
