class Review < ApplicationRecord
  belongs_to :restaurant
  belongs_to :user

  enum grade: { awful: 0, fine: 1, incredible: 2 }

  validates :content, :grade, :user_id, :restaurant_id, presence: true
end
