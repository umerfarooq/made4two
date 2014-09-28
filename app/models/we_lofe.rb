class WeLofe < ActiveRecord::Base
  belongs_to :tour
  validates_presence_of :description
end
