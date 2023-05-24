class Review < ApplicationRecord
  belongs_to :accommodation
  validates :content, presence: true
end
