class GalleryTour < ActiveRecord::Base
  belongs_to :tour
  validates :title, :image, :content, :status, presence: true
  mount_uploader :image, ImageUploader
end
