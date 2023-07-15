require 'rails_helper'

RSpec.describe 'special_offers/index', type: :view do
  before(:each) do
    assign(:special_offers, [
             SpecialOffer.create!(
               name: 'Name',
               description: 'MyText',
               members_only: false,
               offer_type: 'Offer Type',
               offer_code: 'Offer Code',
               lounge: nil
             ),
             SpecialOffer.create!(
               name: 'Name',
               description: 'MyText',
               members_only: false,
               offer_type: 'Offer Type',
               offer_code: 'Offer Code',
               lounge: nil
             )
           ])
  end

  it 'renders a list of special_offers' do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new('Name'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('MyText'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(false.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('Offer Type'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('Offer Code'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end
