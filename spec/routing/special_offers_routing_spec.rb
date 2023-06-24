# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SpecialOffersController, type: :routing do
  describe 'routing' do
    let(:lounge) { FactoryBot.create(:lounge) }
    let(:special_offer) { FactoryBot.create(:special_offer) }

    it 'routes to #index' do
      expect(get: "/lounges/#{lounge.id}/special_offers").to route_to(controller: 'special_offers',
                                                                      action: 'index', lounge_id: lounge.id.to_s)
    end

    it 'routes to #new' do
      expect(get: "/lounges/#{lounge.id}/special_offers/new").to route_to(controller: 'special_offers',
                                                                          action: 'new', lounge_id: lounge.id.to_s)
    end

    it 'routes to #show' do
      expect(get: "/special_offers/#{special_offer.id}").to route_to(controller: 'special_offers',
                                                                     action: 'show', id: special_offer.id.to_s)
    end

    it 'routes to #edit' do
      expect(get: "/special_offers/#{special_offer.id}/edit").to route_to(controller: 'special_offers',
                                                                          action: 'edit', id: special_offer.id.to_s)
    end

    it 'routes to #create' do
      expect(post: "/lounges/#{lounge.id}/special_offers").to route_to(controller: 'special_offers',
                                                                       action: 'create', lounge_id: lounge.id.to_s)
    end

    it 'routes to #update via PUT' do
      expect(put: "/special_offers/#{special_offer.id}").to route_to(controller: 'special_offers',
                                                                     action: 'update', id: special_offer.id.to_s)
    end

    it 'routes to #update via PATCH' do
      expect(patch: "/special_offers/#{special_offer.id}").to route_to(controller: 'special_offers',
                                                                       action: 'update', id: special_offer.id.to_s)
    end

    it 'routes to #destroy' do
      expect(delete: "/special_offers/#{special_offer.id}").to route_to(controller: 'special_offers',
                                                                        action: 'destroy', id: special_offer.id.to_s)
    end
  end
end
