require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    before { get '/users' }
    it 'returns http success' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders index template' do
      expect(response).to render_template('index')
    end

    it 'does not render a different template' do
      expect(response).to_not render_template('show')
    end

    it 'check if the response body includes correct placeholder text' do
      expect(response.body).to include('Here is the first page')
    end
  end

  describe 'GET /show' do
    before { get '/users/1' }
    it 'returns http success' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders show template' do
      expect(response).to render_template('show')
    end

    it 'does not render a different template' do
      expect(response).to_not render_template('index')
    end

    it 'check if the response body includes correct placeholder text' do
      expect(response.body).to include('Users#show')
    end
  end
end
