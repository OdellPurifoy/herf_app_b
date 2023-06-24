# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RsvpsController, type: :routing do
  describe 'routing' do
    let(:event) { FactoryBot.create(:event) }
    let(:rsvp) { FactoryBot.create(:rsvp) }

    it 'routes to #index' do
      expect(get: "/events/#{event.id}/rsvps").to route_to(controller: 'rsvps',
                                                           action: 'index', event_id: event.id.to_s)
    end

    it 'routes to #new' do
      expect(get: "/events/#{event.id}/rsvps/new").to route_to(controller: 'rsvps',
                                                               action: 'new', event_id: event.id.to_s)
    end

    it 'routes to #show' do
      expect(get: "/rsvps/#{rsvp.id}").to route_to(controller: 'rsvps',
                                                   action: 'show', id: rsvp.id.to_s)
    end

    it 'routes to #edit' do
      expect(get: "/rsvps/#{rsvp.id}/edit").to route_to(controller: 'rsvps',
                                                        action: 'edit', id: rsvp.id.to_s)
    end

    it 'routes to #create' do
      expect(post: "/events/#{event.id}/rsvps").to route_to(controller: 'rsvps',
                                                            action: 'create', event_id: event.id.to_s)
    end

    it 'routes to #update via PUT' do
      expect(put: "/rsvps/#{rsvp.id}").to route_to(controller: 'rsvps',
                                                   action: 'update', id: rsvp.id.to_s)
    end

    it 'routes to #update via PATCH' do
      expect(patch: "/rsvps/#{rsvp.id}").to route_to(controller: 'rsvps',
                                                     action: 'update', id: rsvp.id.to_s)
    end

    it 'routes to #destroy' do
      expect(delete: "/rsvps/#{rsvp.id}").to route_to(controller: 'rsvps',
                                                      action: 'destroy', id: rsvp.id.to_s)
    end
  end
end
