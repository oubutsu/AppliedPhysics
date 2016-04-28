class Micropost < ActiveRecord::Base
  belongs_to :event
  validates :content ,presence: true
end
