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
FactoryBot.define do
  factory :notification do
    body { 'MyText' }
    read { false }
    user
  end
end
