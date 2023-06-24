# frozen_string_literal: true

require 'rails_helper'

RSpec.describe EventsController, type: :routing do
  let(:lounge) { FactoryBot.create(:lounge) }
  let(:event) { FactoryBot.create(:event) }

  describe 'routing' do
    it 'routes to #index' do
      expect(get: "/lounges/#{lounge.id}/events").to route_to(controller: 'events',
                                                              action: 'index', lounge_id: lounge.id.to_s)
    end

    it 'routes to #new' do
      expect(get: "/lounges/#{lounge.id}/events/new").to route_to(controller: 'events',
                                                                  action: 'new', lounge_id: lounge.id.to_s)
    end

    it 'routes to #show' do
      expect(get: "/events/#{event.id}").to route_to(controller: 'events',
                                                     action: 'show', id: event.id.to_s)
    end

    it 'routes to #edit' do
      expect(get: "/events/#{event.id}/edit").to route_to(controller: 'events',
                                                          action: 'edit', id: event.id.to_s)
    end

    it 'routes to #create' do
      expect(post: "/lounges/#{lounge.id}/events").to route_to(controller: 'events',
                                                               action: 'create', lounge_id: lounge.id.to_s)
    end

    it 'routes to #update via PUT' do
      expect(put: "/events/#{event.id}").to route_to(controller: 'events',
                                                     action: 'update', id: event.id.to_s)
    end

    it 'routes to #update via PATCH' do
      expect(patch: "/events/#{event.id}").to route_to(controller: 'events',
                                                       action: 'update', id: event.id.to_s)
    end

    it 'routes to #destroy' do
      expect(delete: "/events/#{event.id}").to route_to(controller: 'events',
                                                        action: 'destroy', id: event.id.to_s)
    end
  end
end
