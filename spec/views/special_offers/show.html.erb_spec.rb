require 'rails_helper'

RSpec.describe "special_offers/show", type: :view do
  before(:each) do
    assign(:special_offer, SpecialOffer.create!(
      name: "Name",
      description: "MyText",
      members_only: false,
      offer_type: "Offer Type",
      offer_code: "Offer Code",
      lounge: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/Offer Type/)
    expect(rendered).to match(/Offer Code/)
    expect(rendered).to match(//)
  end
end
