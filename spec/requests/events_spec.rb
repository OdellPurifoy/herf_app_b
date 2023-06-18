# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '/events', type: :request do
  # This should return the minimal set of attributes required to create a valid
  # Event. As you add validations to Event, be sure to
  # adjust the attributes here as well.
  let(:user) { FactoryBot.create(:user) }

  let(:valid_attributes) do
    {
      event_name: 'Test Event Name',
      event_type: 'Live Music',
      event_url: 'http://www.test-event.com',
      event_date: (Date.today + 1.day),
      event_description: 'Attend our event!',
      zoom_code: '1234567',
      rsvp_needed: false,
      is_virtual: true,
      maximum_capacity: 10,
      start_time: (Time.now + 1.day),
      end_time: (Time.now + 1.day) + 4.hours,
      members_only: false,
      lounge: lounge
    }
  end

  let(:invalid_attributes) do
    {
      event_name: '',
      event_type: 'Live Music',
      event_url: 'http://www.test-event.com',
      event_date: (Date.today + 1.day),
      event_description: 'Attend our event!',
      zoom_code: '1234567',
      rsvp_needed: false,
      is_virtual: true,
      maximum_capacity: 10,
      start_time: (Time.now + 1.day),
      end_time: (Time.now + 1.day) + 4.hours,
      members_only: false,
      lounge: lounge
    }
  end

  describe 'GET /lounges/:lounge_id/events' do
    let(:lounge) { FactoryBot.create(:lounge, events: [event]) }
    let(:event) { FactoryBot.create(:event) }

    it 'renders a successful response' do
      get "/lounges/#{lounge.id}/events"
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    let(:lounge) { FactoryBot.create(:lounge, events: [event]) }
    let(:event) { FactoryBot.create(:event) }

    it 'renders a successful response' do
      get "/events/#{event.id}"
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    let(:lounge) { FactoryBot.create(:lounge, user: user) }
    before { sign_in user }

    it 'renders a successful response' do
      get "/lounges/#{lounge.id}/events/new"
      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    let(:lounge) { FactoryBot.create(:lounge, events: [event], user: user) }
    let(:event) { FactoryBot.create(:event) }

    before { sign_in user }

    it 'renders a successful response' do
      get "/events/#{event.id}/edit"
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    let(:lounge) { FactoryBot.create(:lounge, user: user) }
    let(:event) { FactoryBot.create(:event) }

    before { sign_in user }

    context 'with valid parameters' do
      it 'creates a new Event' do
        expect do
          post "/lounges/#{lounge.id}/events", params: { event: valid_attributes }
        end.to change(Event, :count).by(1)
      end

      it 'redirects to the created event' do
        get "/events/#{event.id}", params: { event: valid_attributes }
        expect(response).to have_http_status(:ok)
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Event' do
        expect do
          post "/lounges/#{lounge.id}/events", params: { event: invalid_attributes }
        end.to change(Event, :count).by(0)
      end
    end
  end

  describe 'PATCH /update' do
    before { sign_in user }

    context 'with valid parameters' do
      let(:lounge) { FactoryBot.create(:lounge) }
      let(:new_attributes) do
        {
          event_name: 'Updated Test Event Name',
          event_type: 'Live Music',
          event_url: 'http://www.test-event.com',
          event_date: (Date.today + 1.day),
          zoom_code: '1234567',
          rsvp_needed: false,
          is_virtual: true,
          maximum_capacity: 10,
          start_time: (Time.now + 1.day),
          end_time: (Time.now + 1.day) + 4.hours,
          members_only: false,
          lounge: lounge
        }
      end

      it 'updates the requested event' do
        event = Event.create! valid_attributes
        patch event_url(event), params: { event: new_attributes }
        event.reload
        skip('Add assertions for updated state')
      end

      it 'redirects to the event' do
        event = Event.create! valid_attributes
        patch event_url(event), params: { event: new_attributes }
        event.reload
        expect(response).to redirect_to(event_url(event))
      end
    end

    context 'with invalid parameters' do
      let(:lounge) { FactoryBot.create(:lounge) }

      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        event = Event.create! valid_attributes
        patch event_url(event), params: { event: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'DELETE /destroy' do
    let(:lounge) { FactoryBot.create(:lounge) }

    before { sign_in user }

    it 'destroys the requested event' do
      event = Event.create! valid_attributes
      expect do
        delete event_url(event)
      end.to change(Event, :count).by(-1)
    end

    it 'redirects to the events list' do
      event = Event.create! valid_attributes
      delete event_url(event)
      expect(response).to redirect_to(root_path)
    end
  end
end
