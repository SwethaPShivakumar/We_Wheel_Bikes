class Bike < ApplicationRecord
  has_many :reviews, through: :bookings, dependent: :destroy
  has_many :bookings
  belongs_to :user
end
