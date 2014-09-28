class Page < ActiveRecord::Base
	has_many :detail_abouts
	validates_uniqueness_of :permalink
	accepts_nested_attributes_for :detail_abouts
	mount_uploader :image, ImageTourUploader
end
