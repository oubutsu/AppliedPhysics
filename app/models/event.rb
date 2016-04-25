class Event < ActiveRecord::Base
  has_many :microposts
end
