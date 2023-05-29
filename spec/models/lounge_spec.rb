# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Lounge, type: :model do
  it { should have_db_column(:alcohol_served).of_type(:boolean) }
  it { should have_db_column(:name).of_type(:string) }
  it { should have_db_column(:phone_number).of_type(:string) }
  it { should have_db_column(:email).of_type(:string) }
  it { should have_db_column(:description).of_type(:text) }
  it { should have_db_column(:food_served).of_type(:boolean) }
  it { should have_db_column(:outside_cigars_allowed).of_type(:boolean) }
  it { should have_db_column(:outside_alcohol_allowed).of_type(:boolean) }
  it { should have_db_column(:created_at).of_type(:datetime) }
  it { should have_db_column(:updated_at).of_type(:datetime) }
  it { should have_db_index([:user_id]) }

  describe 'Creating a lounge with a user' do
    let(:user) { FactoryBot.create(:user) }
    let(:lounge) { FactoryBot.build(:lounge, user: user) }

    it 'creates the lounge without error' do
      lounge.save!
      expect { lounge }.to_not raise_error
    end

    it 'creates the correct association between the user and the lounge' do
      expect(lounge.user).to eq user
    end
  end

  describe 'Creating a lounge without a user' do
    let(:lounge) { FactoryBot.create(:lounge, user: nil) }

    it 'raises an error' do
      expect { lounge }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end

  describe 'Creating a lounge without required attributes' do
    let(:lounge) { FactoryBot.create(:lounge, name: '', phone_number: '', description: '') }

    it 'raises an error' do
      expect { lounge }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end
end
