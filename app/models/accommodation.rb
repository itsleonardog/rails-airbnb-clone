class Accommodation < ApplicationRecord
  has_many_attached :photos
  has_many :reviews, dependent: :destroy

  def image_url_string
    if photos.attached?
      photos.first.url
    else
      default_image_url
    end
  end
end
