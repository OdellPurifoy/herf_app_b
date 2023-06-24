# frozen_string_literal: true

require 'rails_helper'

RSpec.describe LoungesController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/lounges').to route_to('lounges#index')
    end

    it 'routes to #new' do
      expect(get: '/lounges/new').to route_to('lounges#new')
    end

    it 'routes to #show' do
      expect(get: '/lounges/1').to route_to('lounges#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/lounges/1/edit').to route_to('lounges#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/lounges').to route_to('lounges#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/lounges/1').to route_to('lounges#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/lounges/1').to route_to('lounges#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/lounges/1').to route_to('lounges#destroy', id: '1')
    end
  end
end
