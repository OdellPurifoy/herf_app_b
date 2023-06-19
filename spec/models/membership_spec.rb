# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Membership, type: :model do
  it { should have_db_column(:first_name).of_type(:string) }
  it { should have_db_column(:last_name).of_type(:string) }
  it { should have_db_column(:email).of_type(:string) }
  it { should have_db_column(:phone_number).of_type(:string) }
  it { should have_db_column(:do_not_text).of_type(:boolean) }
  it { should have_db_index([:lounge_id]) }
end
