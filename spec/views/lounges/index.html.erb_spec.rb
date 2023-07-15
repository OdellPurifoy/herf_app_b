require 'rails_helper'

RSpec.describe 'lounges/index', type: :view do
  before(:each) do
    assign(:lounges, [
             Lounge.create!(
               name: 'Name',
               phone_number: 'Phone Number',
               email: 'Email',
               description: 'MyText',
               alcohol_served: false,
               food_served: false,
               outside_alcohol_allowed: false,
               outside_cigars_allowed: false,
               user: nil
             ),
             Lounge.create!(
               name: 'Name',
               phone_number: 'Phone Number',
               email: 'Email',
               description: 'MyText',
               alcohol_served: false,
               food_served: false,
               outside_alcohol_allowed: false,
               outside_cigars_allowed: false,
               user: nil
             )
           ])
  end

  it 'renders a list of lounges' do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new('Name'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('Phone Number'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('Email'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('MyText'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(false.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(false.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(false.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(false.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end
