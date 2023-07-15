require 'rails_helper'

RSpec.describe 'EventFlyers', type: :request do
  describe 'GET /destroy' do
    it 'returns http success' do
      get '/event_flyers/destroy'
      expect(response).to have_http_status(:success)
    end
  end
end
