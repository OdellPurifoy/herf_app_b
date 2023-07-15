require 'rails_helper'

RSpec.describe 'special_offers/new', type: :view do
  before(:each) do
    assign(:special_offer, SpecialOffer.new(
                             name: 'MyString',
                             description: 'MyText',
                             members_only: false,
                             offer_type: 'MyString',
                             offer_code: 'MyString',
                             lounge: nil
                           ))
  end

  it 'renders new special_offer form' do
    render

    assert_select 'form[action=?][method=?]', special_offers_path, 'post' do
      assert_select 'input[name=?]', 'special_offer[name]'

      assert_select 'textarea[name=?]', 'special_offer[description]'

      assert_select 'input[name=?]', 'special_offer[members_only]'

      assert_select 'input[name=?]', 'special_offer[offer_type]'

      assert_select 'input[name=?]', 'special_offer[offer_code]'

      assert_select 'input[name=?]', 'special_offer[lounge_id]'
    end
  end
end
