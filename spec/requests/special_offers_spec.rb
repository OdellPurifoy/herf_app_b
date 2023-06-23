# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '/special_offers', type: :request do
  # This should return the minimal set of attributes required to create a valid
  # SpecialOffer. As you add validations to SpecialOffer, be sure to
  # adjust the attributes here as well.
  let(:user) { FactoryBot.create(:user) }
  let(:lounge) { FactoryBot.create(:lounge) }
  let(:valid_attributes) do
    {
      name: 'BOGO Special Offer',
      start_date: Date.today,
      end_date: Date.today + 1.week,
      description: 'Awesome new special offer',
      members_only: false,
      offer_type: 'BOGO (Buy One, get one)',
      offer_code: 'BOGO123',
      lounge: lounge
    }
  end

  let(:invalid_attributes) do
    {
      start_date: Date.today,
      end_date: Date.today + 1.week,
      description: 'Awesome new special offer',
      members_only: false,
      offer_type: 'BOGO (Buy One, get one)',
      offer_code: 'BOGO123',
      lounge: lounge
    }
  end

  describe 'GET /index' do
    let(:lounge) { FactoryBot.create(:lounge) }

    it 'renders a successful response' do
      get "/lounges/#{lounge.id}/special_offers"
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    let(:special_offer) { FactoryBot.create(:special_offer) }

    it 'renders a successful response' do
      get "/special_offers/#{special_offer.id}"
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    let(:lounge) { FactoryBot.create(:lounge) }

    before { sign_in user }

    it 'renders a successful response' do
      get "/lounges/#{lounge.id}/special_offers/new"
      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    let(:special_offer) { FactoryBot.create(:special_offer) }

    before { sign_in user }

    it 'renders a successful response' do
      get "/special_offers/#{special_offer.id}/edit"
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    before { sign_in user }

    context 'with valid parameters' do
      it 'creates a new SpecialOffer' do
        expect do
          post "/lounges/#{lounge.id}/special_offers", params: { special_offer: valid_attributes }
        end.to change(SpecialOffer, :count).by(1)
      end

      it 'redirects to the created special_offer' do
        post "/lounges/#{lounge.id}/special_offers", params: { special_offer: valid_attributes }
        expect(response).to redirect_to(special_offer_url(SpecialOffer.last))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new SpecialOffer' do
        expect do
          post "/lounges/#{lounge.id}/special_offers", params: { special_offer: invalid_attributes }
        end.to change(SpecialOffer, :count).by(0)
      end

      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post "/lounges/#{lounge.id}/special_offers", params: { special_offer: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'PATCH /update' do
    let(:special_offer) { FactoryBot.create(:special_offer) }

    before { sign_in user }

    context 'with valid parameters' do
      let(:new_attributes) do
        {
          name: 'Padron 25% off!',
          start_date: Date.today,
          end_date: Date.today + 1.week,
          description: 'Awesome new special offer',
          members_only: false,
          offer_type: 'BOGO (Buy One, get one)',
          offer_code: 'BOGO123',
          lounge: lounge
        }
      end

      it 'updates the requested special_offer' do
        patch "/special_offers/#{special_offer.id}", params: { special_offer: new_attributes }
        special_offer.reload
        expect(response).to have_http_status(302)
      end

      it 'redirects to the special_offer' do
        patch "/special_offers/#{special_offer.id}", params: { special_offer: new_attributes }
        special_offer.reload
        expect(response).to redirect_to(special_offer_url(special_offer))
      end
    end

    context 'with invalid parameters' do
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        patch "/special_offers/#{special_offer.id}", params: { special_offer: invalid_attributes }
        expect(response).to have_http_status(302)
      end
    end
  end

  describe 'DELETE /destroy' do
    let!(:special_offer) { FactoryBot.create(:special_offer) }

    before { sign_in user }

    it 'destroys the requested special_offer' do
      expect do
        delete "/special_offers/#{special_offer.id}"
      end.to change(SpecialOffer, :count).by(-1)
    end

    it 'redirects to the special_offers list' do
      delete "/special_offers/#{special_offer.id}"
      expect(response).to redirect_to(root_path)
    end
  end
end
