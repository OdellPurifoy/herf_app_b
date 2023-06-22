require 'rails_helper'

RSpec.describe "special_offers/edit", type: :view do
  let(:special_offer) {
    SpecialOffer.create!(
      name: "MyString",
      description: "MyText",
      members_only: false,
      offer_type: "MyString",
      offer_code: "MyString",
      lounge: nil
    )
  }

  before(:each) do
    assign(:special_offer, special_offer)
  end

  it "renders the edit special_offer form" do
    render

    assert_select "form[action=?][method=?]", special_offer_path(special_offer), "post" do

      assert_select "input[name=?]", "special_offer[name]"

      assert_select "textarea[name=?]", "special_offer[description]"

      assert_select "input[name=?]", "special_offer[members_only]"

      assert_select "input[name=?]", "special_offer[offer_type]"

      assert_select "input[name=?]", "special_offer[offer_code]"

      assert_select "input[name=?]", "special_offer[lounge_id]"
    end
  end
end
