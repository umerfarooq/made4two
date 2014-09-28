class Stuff < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged
  self.inheritance_column = nil
  has_many :tours, dependent: :destroy
  validates :name, :type, :status, presence: true
end
