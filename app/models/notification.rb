# == Schema Information
#
# Table name: notifications
#
#  id         :uuid             not null, primary key
#  body       :text             not null
#  read       :boolean          default(FALSE)
#  user_id    :uuid             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Notification < ApplicationRecord
  belongs_to :user

  validates_presence_of :body

  scope :read, -> { where(read: true) }
  scope :unread, -> { where(read: false) }
end
