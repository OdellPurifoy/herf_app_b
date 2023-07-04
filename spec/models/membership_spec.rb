# frozen_string_literal: true

# == Schema Information
#
# Table name: memberships
#
#  id           :uuid             not null, primary key
#  first_name   :string           not null
#  last_name    :string           not null
#  email        :string           not null
#  phone_number :string
#  do_not_text  :boolean
#  lounge_id    :uuid             not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  active       :boolean          default(TRUE)
#
require 'rails_helper'

RSpec.describe Membership, type: :model do
  it { should have_db_column(:first_name).of_type(:string) }
  it { should have_db_column(:last_name).of_type(:string) }
  it { should have_db_column(:email).of_type(:string) }
  it { should have_db_column(:phone_number).of_type(:string) }
  it { should have_db_column(:do_not_text).of_type(:boolean) }
  it { should have_db_column(:active).of_type(:boolean) }
  it { should have_db_index([:lounge_id]) }
end
