require 'rails_helper'

RSpec.describe "SpecialOfferFlyers", type: :request do
  describe "GET /destroy" do
    it "returns http success" do
      get "/special_offer_flyer/destroy"
      expect(response).to have_http_status(:success)
    end
  end

end
