class Voucher < ActiveRecord::Base
	belongs_to :user
	validates :code, :discount, :user_id, presence: true
	validates_uniqueness_of :code
	validates_numericality_of :discount, greater_than: 0
	validates_numericality_of :discount, less_than_or_equal: 100
end
