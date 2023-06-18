# frozen_string_literal: true

# == Schema Information
#
# Table name: lounges
#
#  id                      :uuid             not null, primary key
#  name                    :string           not null
#  phone_number            :string           not null
#  email                   :string
#  description             :text             not null
#  alcohol_served          :boolean          default(FALSE)
#  food_served             :boolean          default(FALSE)
#  outside_alcohol_allowed :boolean          default(FALSE)
#  outside_cigars_allowed  :boolean          default(FALSE)
#  user_id                 :uuid             not null
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#
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

  describe 'Email REGEX validation' do
    let(:lounge) { FactoryBot.create(:lounge, email: 'invalid_emailexample.com') }

    it "raises an Email invalid error" do
      expect{lounge}.to raise_error(ActiveRecord::RecordInvalid, "Validation failed: Email Email invalid")
    end

    context "when valid email is used" do
      let(:lounge) { FactoryBot.create(:lounge, email: 'valid_email@example.com') }

      it "does not raise an error" do
        expect{lounge}.to_not raise_error
      end
    end
  end
end
