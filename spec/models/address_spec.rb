# frozen_string_literal: true

# == Schema Information
#
# Table name: addresses
#
#  id               :uuid             not null, primary key
#  address_street_1 :string           not null
#  address_street_2 :string
#  city             :string           not null
#  state            :string           not null
#  zipcode          :string           not null
#  lounge_id        :uuid             not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
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

  describe 'Zipcode validation' do
    let(:address) { FactoryBot.create(:address, zipcode: '3463fsgfsfgs') }

    it 'is not a valid zipcode' do
      expect { address }.to raise_error(ActiveRecord::RecordInvalid)
    end

    context 'when valid 5 digit zipcode is used' do
      let(:address) { FactoryBot.create(:address, zipcode: '11211') }

      it 'does not raise an error' do
        expect { address }.to_not raise_error(ActiveRecord::RecordInvalid)
      end
    end

    context 'when valid 9 digit zip code is used' do
      let(:address) { FactoryBot.create(:address, zipcode: '12345-1234') }

      it 'does not raise an error' do
        expect { address }.to_not raise_error(ActiveRecord::RecordInvalid)
      end
    end
  end
end
