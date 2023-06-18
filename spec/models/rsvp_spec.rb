# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Rsvp, type: :model do
  it { should have_db_column(:first_name).of_type(:string) }
  it { should have_db_column(:last_name).of_type(:string) }
  it { should have_db_column(:email).of_type(:string) }
  it { should have_db_column(:phone_number).of_type(:string) }
  it { should have_db_column(:number_of_guests).of_type(:integer) }
  it { should have_db_index([:event_id]) }
end
