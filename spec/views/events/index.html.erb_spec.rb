require 'rails_helper'

RSpec.describe 'events/index', type: :view do
  before(:each) do
    assign(:events, [
             Event.create!(
               event_name: 'Event Name',
               event_type: 'Event Type',
               event_url: 'Event Url',
               zoom_code: 'Zoom Code',
               rsvp_needed: false,
               maximum_capacity: 2,
               members_only: false,
               lounge: nil
             ),
             Event.create!(
               event_name: 'Event Name',
               event_type: 'Event Type',
               event_url: 'Event Url',
               zoom_code: 'Zoom Code',
               rsvp_needed: false,
               maximum_capacity: 2,
               members_only: false,
               lounge: nil
             )
           ])
  end

  it 'renders a list of events' do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new('Event Name'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('Event Type'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('Event Url'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('Zoom Code'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(false.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(false.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end
