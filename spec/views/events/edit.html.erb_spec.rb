require 'rails_helper'

RSpec.describe 'events/edit', type: :view do
  let(:event) do
    Event.create!(
      event_name: 'MyString',
      event_type: 'MyString',
      event_url: 'MyString',
      zoom_code: 'MyString',
      rsvp_needed: false,
      maximum_capacity: 1,
      members_only: false,
      lounge: nil
    )
  end

  before(:each) do
    assign(:event, event)
  end

  it 'renders the edit event form' do
    render

    assert_select 'form[action=?][method=?]', event_path(event), 'post' do
      assert_select 'input[name=?]', 'event[event_name]'

      assert_select 'input[name=?]', 'event[event_type]'

      assert_select 'input[name=?]', 'event[event_url]'

      assert_select 'input[name=?]', 'event[zoom_code]'

      assert_select 'input[name=?]', 'event[rsvp_needed]'

      assert_select 'input[name=?]', 'event[maximum_capacity]'

      assert_select 'input[name=?]', 'event[members_only]'

      assert_select 'input[name=?]', 'event[lounge_id]'
    end
  end
end
