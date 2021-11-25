class Booking < ApplicationRecord
  has_many :reviews
  belongs_to :user
  belongs_to :bike

  validates :start_day, presence: true
  validates :finish_day, presence: true
end
