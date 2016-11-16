class Status < ActiveRecord::Base
  belongs_to :dog

  validates_presence_of :dog_id, :body
end
