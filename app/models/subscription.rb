class Subscription < ActiveRecord::Base
  validates :email, presence: true
end
