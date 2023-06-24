# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MembershipsController, type: :routing do
  describe 'routing' do
    let(:lounge) { FactoryBot.create(:lounge) }
    let(:membership) { FactoryBot.create(:membership) }

    it 'routes to #index' do
      expect(get: "/lounges/#{lounge.id}/memberships").to route_to(controller: 'memberships',
                                                                   action: 'index', lounge_id: lounge.id.to_s)
    end

    it 'routes to #new' do
      expect(get: "/lounges/#{lounge.id}/memberships/new").to route_to(controller: 'memberships',
                                                                       action: 'new', lounge_id: lounge.id.to_s)
    end

    it 'routes to #show' do
      expect(get: "/memberships/#{membership.id}").to route_to(controller: 'memberships',
                                                               action: 'show', id: membership.id.to_s)
    end

    it 'routes to #edit' do
      expect(get: "/memberships/#{membership.id}/edit").to route_to(controller: 'memberships',
                                                                    action: 'edit', id: membership.id.to_s)
    end

    it 'routes to #create' do
      expect(post: "/lounges/#{lounge.id}/memberships").to route_to(controller: 'memberships',
                                                                    action: 'create', lounge_id: lounge.id.to_s)
    end

    it 'routes to #update via PUT' do
      expect(put: "/memberships/#{membership.id}").to route_to(controller: 'memberships',
                                                               action: 'update', id: membership.id.to_s)
    end

    it 'routes to #update via PATCH' do
      expect(patch: "/memberships/#{membership.id}").to route_to(controller: 'memberships',
                                                                 action: 'update', id: membership.id.to_s)
    end

    it 'routes to #destroy' do
      expect(delete: "/memberships/#{membership.id}").to route_to(controller: 'memberships',
                                                                  action: 'destroy', id: membership.id.to_s)
    end
  end
end
