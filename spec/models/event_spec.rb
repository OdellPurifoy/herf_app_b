# == Schema Information
#
# Table name: events
#
#  id                :uuid             not null, primary key
#  event_name        :string           not null
#  event_type        :string           not null
#  event_url         :string
#  zoom_code         :string
#  rsvp_needed       :boolean          default(FALSE)
#  maximum_capacity  :integer
#  start_time        :time             not null
#  end_time          :time             not null
#  members_only      :boolean          default(FALSE)
#  lounge_id         :uuid             not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  event_date        :date             not null
#  is_virtual        :boolean          default(FALSE)
#  event_description :text
#
require 'rails_helper'

RSpec.describe Event, type: :model do
  describe 'Database columns' do
    it { should have_db_column(:event_name).of_type(:string) }
    it { should have_db_column(:end_time).of_type(:time) }
    it { should have_db_column(:event_date).of_type(:date) }
    it { should have_db_column(:event_description).of_type(:text) }
    it { should have_db_column(:event_type).of_type(:string) }
    it { should have_db_column(:event_url).of_type(:string) }
    it { should have_db_column(:is_virtual).of_type(:boolean) }
    it { should have_db_column(:maximum_capacity).of_type(:integer) }
    it { should have_db_column(:members_only).of_type(:boolean) }
    it { should have_db_column(:rsvp_needed).of_type(:boolean) }
    it { should have_db_column(:start_time).of_type(:time) }
    it { should have_db_index([:lounge_id]) }
  end

  describe 'Conditional Validations' do
    let(:event) { FactoryBot.create(:event, is_virtual: true, event_url: '') }

    it 'triggers a validation error' do
      expect { event }.to raise_error(ActiveRecord::RecordInvalid, 'Validation failed: Event url is not a valid URL')
    end

    context "when event_type is 'Virtual and event_url is provided" do
      let(:event_2) { FactoryBot.create(:event, is_virtual: false) }

      it 'does not trigger a validation error' do
        expect { event_2 }.to_not raise_error
      end
    end

    context 'when the url is provided but it is invalid' do
      let(:event_3) { FactoryBot.create(:event, is_virtual: true, event_url: 'test-event.com') }

      it 'trigger an invalid url error' do
        expect { event_3 }.to raise_error
      end
    end
  end

  describe 'Event description length validation' do
    let(:event) { FactoryBot.create(:event, event_description: 'Come join us for our event!') }

    it 'does not raise a length validation error' do
      expect { event }.to_not raise_error
    end

    context 'when the event_description is too long' do
      let(:event) { FactoryBot.create(:event, event_description: Faker::Lorem.paragraph_by_chars(number: 2001)) }

      it 'raises a length validation error' do
        expect { event }.to raise_error
      end
    end
  end
end
