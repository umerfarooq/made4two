class Message < ActiveRecord::Base
  validates_presence_of :name, :subject, :message, message: "can't blank"  
end
