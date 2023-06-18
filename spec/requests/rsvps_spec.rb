# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '/rsvps', type: :request do
  # This should return the minimal set of attributes required to create a valid
  # Rsvp. As you add validations to Rsvp, be sure to
  # adjust the attributes here as well.
  let(:user) { FactoryBot.create(:user) }
  let(:valid_attributes) do
    {
      first_name: 'Jeff',
      last_name: 'Gordon',
      email: 'jeffgordon@example.com',
      phone_number: '800-123-4567',
      number_of_guests: 2,
      attended: false
    }
  end

  let(:invalid_attributes) do
    {
      last_name: 'Gordon',
      email: 'jeffgordon@example.com',
      phone_number: '800-123-4567',
      number_of_guests: 2,
      attended: false
    }
  end

  describe 'GET /index' do
    let(:event) { FactoryBot.create(:event) }

    it 'renders a successful response' do
      get "/events/#{event.id}/rsvps"
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    let(:event) { FactoryBot.create(:event, rsvps: [rsvp]) }
    let(:rsvp) { FactoryBot.create(:rsvp) }

    it 'renders a successful response' do
      get "/rsvps/#{rsvp.id}"
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    let(:event) { FactoryBot.create(:event) }

    before { sign_in user }

    it 'renders a successful response' do
      get "/events/#{event.id}/rsvps/new"
      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    let(:rsvp) { FactoryBot.create(:rsvp) }

    before { sign_in user }

    it 'renders a successful response' do
      get "/rsvps/#{rsvp.id}/edit"
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    let(:event) { FactoryBot.create(:event) }

    before { sign_in user }

    context 'with valid parameters' do
      it 'creates a new Rsvp' do
        expect do
          post "/events/#{event.id}/rsvps", params: { rsvp: valid_attributes }
        end.to change(Rsvp, :count).by(1)
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Rsvp' do
        expect do
          post "/events/#{event.id}/rsvps", params: { rsvp: invalid_attributes }
        end.to change(Rsvp, :count).by(0)
      end

      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post "/events/#{event.id}/rsvps", params: { rsvp: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'PATCH /update' do
    let(:rsvp) { FactoryBot.create(:rsvp) }

    before { sign_in user }

    context 'with valid parameters' do
      let(:new_attributes) do
        {
          first_name: 'Jeff',
          last_name: 'Gordon',
          email: 'jeffgordon@example.com',
          phone_number: '800-123-4567',
          number_of_guests: 4,
          attended: false
        }
      end

      it 'updates the requested rsvp' do
        patch rsvp_url(rsvp), params: { rsvp: new_attributes }
        rsvp.reload
        expect(response).to have_http_status(302)
      end

      it 'redirects to the rsvp' do
        patch rsvp_url(rsvp), params: { rsvp: new_attributes }
        rsvp.reload
        expect(response).to redirect_to(rsvp_url(rsvp))
      end
    end

    # context "with invalid parameters" do

    # it "renders a response with 422 status (i.e. to display the 'edit' template)" do
    #   patch "/rsvps/#{rsvp.id}", params: { rsvp: invalid_attributes }
    #   expect(response).to have_http_status(:unprocessable_entity)
    # end

    # end
  end
end
