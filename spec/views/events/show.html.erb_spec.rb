require 'rails_helper'

RSpec.describe 'events/show', type: :view do
  before(:each) do
    assign(:event, Event.create!(
                     event_name: 'Event Name',
                     event_type: 'Event Type',
                     event_url: 'Event Url',
                     zoom_code: 'Zoom Code',
                     rsvp_needed: false,
                     maximum_capacity: 2,
                     members_only: false,
                     lounge: nil
                   ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Event Name/)
    expect(rendered).to match(/Event Type/)
    expect(rendered).to match(/Event Url/)
    expect(rendered).to match(/Zoom Code/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(//)
  end
end
