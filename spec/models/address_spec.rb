# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Address, type: :model do
  it { should have_db_column(:address_street_1).of_type(:string) }
  it { should have_db_column(:address_street_2).of_type(:string) }
  it { should have_db_column(:city).of_type(:string) }
  it { should have_db_column(:state).of_type(:string) }
  it { should have_db_column(:zipcode).of_type(:string) }

  describe 'Creating an address without a lounge' do
    let(:address) { FactoryBot.create(:address, lounge: nil) }

    it 'raises an error' do
      expect { address }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end

  describe 'Creating an address without required attributes' do
    let(:address) { FactoryBot.create(:address, address_street_1: '', city: '', state: '') }

    it 'raises an error' do
      expect { address }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end
end
