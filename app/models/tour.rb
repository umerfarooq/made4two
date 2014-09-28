class Tour < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged
  self.inheritance_column = nil
  belongs_to :stuff
  has_many :gallery_tours, dependent: :destroy
  has_many :line_items
  has_many :wishlists, dependent: :destroy
  has_many :we_loves, dependent: :destroy
  has_many :includes, dependent: :destroy

  before_destroy :ensure_not_referenced_by_any_line_item
  validates :title, :location,:price, :supplier_company, :image, :stuff_id,:description,:availability, :type, presence: true
  mount_uploader :image, ImageTourUploader
  accepts_nested_attributes_for :we_loves, allow_destroy: true
  accepts_nested_attributes_for :includes, allow_destroy: true
  accepts_nested_attributes_for :gallery_tours, allow_destroy: true
  scope :getaway, -> { order(id: :desc).find_by(type: 'getaway')}
  scope :local, -> { order(id: :desc).find_by(type: 'local')}
  

  def self.search(search)
    if search
      where('LOWER(title) ILIKE ?',"%#{search.downcase}%")
    else
      find(:all)
    end
  end
  private
    def ensure_not_referenced_by_any_line_item
      if line_items.empty?
          return true
        else
          errors.add(:base, 'Line Items present')
          return false
      end
    end
end
