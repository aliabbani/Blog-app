require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /index" do
    before {get users_path}
    it 'check if response status was correct' do
      expect(response).to have_http_status(:ok)
    end

    it 'check if a correct template was rendered' do
      expect(response).to render_template(:index) 
    end
    
    it "does not render a different template" do
      expect(response).to_not render_template(:show)
    end

    it 'check if the response body includes correct placeholder text' do
      expect(response.body).to include('users')
    end
  end
end

RSpec.describe "Users", type: :request do
  describe "GET /show" do
    before {get user_path(5)}
    it 'check if response status was correct' do
      expect(response).to have_http_status(:ok)
    end

    it 'check if a correct template was rendered' do
      expect(response).to render_template(:show) 
    end

    it "does not render a different template" do
      expect(response).to_not render_template(:index)
    end

    it 'check if the response body includes correct placeholder text' do
      expect(response.body).to include('Here is the page for a specific user')
    end
  end
end
