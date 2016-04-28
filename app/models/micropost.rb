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


class Micropost < ActiveRecord::Base
  belongs_to :event
  validates :content ,presence: true
end
