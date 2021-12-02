require 'rails_helper'

RSpec.describe "Pages", type: :request do
  describe "GET /index" do
    before { get users_path }
    it 'check if response status was correct' do
      expect(response).to have_http_status(:ok)
    end

    it 'check if a correct template was rendered' do
      expect(response).to render_template(:index) 
    end

    it 'check if the response body includes correct placeholder text' do
      expect(response.body).to include("Here is the home page http://")
    end
  end
end
