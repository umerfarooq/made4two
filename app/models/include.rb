class Include < ActiveRecord::Base
  belongs_to :tour
  validates_presence_of :description
end
