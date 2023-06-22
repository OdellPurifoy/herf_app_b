# == Schema Information
#
# Table name: special_offers
#
#  id           :uuid             not null, primary key
#  name         :string           not null
#  start_date   :date             not null
#  end_date     :date             not null
#  description  :text             not null
#  members_only :boolean
#  offer_type   :string           not null
#  offer_code   :string
#  lounge_id    :uuid             not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
require 'rails_helper'

RSpec.describe SpecialOffer, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
