class Accommodation < ApplicationRecord
  has_many_attached :photos
  has_many :reviews, dependent: :destroy
end
