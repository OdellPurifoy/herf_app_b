require 'rails_helper'

RSpec.describe 'rsvps/show', type: :view do
  before(:each) do
    assign(:rsvp, Rsvp.create!(
                    first_name: 'First Name',
                    last_name: 'Last Name',
                    phone_number: 'Phone Number',
                    email: 'Email',
                    number_of_guests: 2,
                    attended: false,
                    event: nil
                  ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/First Name/)
    expect(rendered).to match(/Last Name/)
    expect(rendered).to match(/Phone Number/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(//)
  end
end
