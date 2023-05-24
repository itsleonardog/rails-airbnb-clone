class Accommodation < ApplicationRecord
  has_many :reviews, dependent: :destroy
end
