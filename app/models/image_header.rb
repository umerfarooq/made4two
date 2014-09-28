class ImageHeader < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  scope :active, -> { order(id: :desc).where(status: true)}
end
