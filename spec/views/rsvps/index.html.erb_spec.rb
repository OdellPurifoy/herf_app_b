require 'rails_helper'

RSpec.describe 'rsvps/index', type: :view do
  before(:each) do
    assign(:rsvps, [
             Rsvp.create!(
               first_name: 'First Name',
               last_name: 'Last Name',
               phone_number: 'Phone Number',
               email: 'Email',
               number_of_guests: 2,
               attended: false,
               event: nil
             ),
             Rsvp.create!(
               first_name: 'First Name',
               last_name: 'Last Name',
               phone_number: 'Phone Number',
               email: 'Email',
               number_of_guests: 2,
               attended: false,
               event: nil
             )
           ])
  end

  it 'renders a list of rsvps' do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new('First Name'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('Last Name'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('Phone Number'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('Email'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(false.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end
