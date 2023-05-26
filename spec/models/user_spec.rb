# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Database columns' do
    it { should have_db_column(:date_of_birth).of_type(:date) }
    it { should have_db_column(:email).of_type(:string) }
    it { should have_db_column(:first_name).of_type(:string) }
    it { should have_db_column(:last_name).of_type(:string) }
    it { should have_db_column(:phone_number).of_type(:string) }
    it { should have_db_column(:username).of_type(:string) }
  end

  describe 'Validations' do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:date_of_birth) }
    it { should validate_presence_of(:username) }
  end
end
