require 'rails_helper'

RSpec.describe 'lounges/show', type: :view do
  before(:each) do
    assign(:lounge, Lounge.create!(
                      name: 'Name',
                      phone_number: 'Phone Number',
                      email: 'Email',
                      description: 'MyText',
                      alcohol_served: false,
                      food_served: false,
                      outside_alcohol_allowed: false,
                      outside_cigars_allowed: false,
                      user: nil
                    ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Phone Number/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(//)
  end
end
