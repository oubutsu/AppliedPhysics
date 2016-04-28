# == Schema Information
#
# Table name: camps
#
#  id         :integer          not null, primary key
#  course_id  :integer
#  item_id    :integer
#  name       :string(255)      not null
#  condition  :text(65535)
#  deleted_at :datetime
#  created_at :datetime
#  updated_at :datetime
#  dojo_id    :integer
#

class Event < ActiveRecord::Base
  has_many :microposts
  validates :name ,presence: true
  validates :deadline ,presence: true
  validates :place ,presence: true
end
