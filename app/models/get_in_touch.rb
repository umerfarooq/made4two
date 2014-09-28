class GetInTouch < ActiveRecord::Base
  validates :name, :email, :subject, :message, presence: true
end
