class Event < ActiveRecord::Base
  has_many :microposts
  validates :name ,presence: true
  validates :deadline ,presence: true
  validates :place ,presence: true
end
