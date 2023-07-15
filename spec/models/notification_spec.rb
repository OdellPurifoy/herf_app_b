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
require 'rails_helper'

RSpec.describe Notification, type: :model do
  describe 'Database columns' do
    it { should have_db_column(:body).of_type(:text) }
    it { should have_db_column(:read).of_type(:boolean) }
    it { should have_db_index([:user_id]) }
  end

  describe 'Model Associations' do
    it { should belong_to(:user) }
  end
end
