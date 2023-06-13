require 'rails_helper'

RSpec.describe Event, type: :model do
  describe 'Database columns' do
    it { should have_db_column(:event_name).of_type(:string) }
    it { should have_db_column(:end_time).of_type(:datetime) }
    it { should have_db_column(:event_date).of_type(:date) }
    it { should have_db_column(:event_type).of_type(:string) }
    it { should have_db_column(:event_url).of_type(:string) }
    it { should have_db_column(:maximum_capacity).of_type(:integer) }
    it { should have_db_column(:members_only).of_type(:boolean) }
    it { should have_db_column(:rsvp_needed).of_type(:boolean) }
    it { should have_db_column(:start_time).of_type(:datetime) }
    it { should have_db_index([:lounge_id]) }
  end
end
