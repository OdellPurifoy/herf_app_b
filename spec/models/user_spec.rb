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

  describe 'Custom validations' do
    context 'when a user is under 18 years of age' do
      let(:user) { FactoryBot.create(:user, date_of_birth: (Time.zone.now - 12.years).to_date) }

      it 'raises an error' do
        expect { user }.to raise_error
      end
    end

    context 'when a user if older than 18 year of age' do
      let(:user) { FactoryBot.create(:user, date_of_birth: (Time.zone.now - 19.years).to_date) }

      it 'does not raise an error' do
        expect { user }.to_not raise_error
      end
    end
  end
end
