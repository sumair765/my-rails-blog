require 'rails_helper'

RSpec.describe 'Users', type: :request do
  context 'GET /index' do
    before(:example) { get '/users' }

    it 'Checks the response status to be correct' do
      expect(response).to have_http_status(:ok)
      expect(response).to have_http_status(200)
    end

    it 'Checks that correct template is being rendered' do
      expect(response).to render_template(:user_list)
    end

    it 'Checks if the response body includes the correct placeholder text' do
      expect(response.body).to include('Users#list')
    end
  end

  context 'GET /show' do
    before(:example) { get '/users/:id' }

    it 'Checks the response status to be correct' do
      expect(response).to have_http_status(200)
      expect(response).to have_http_status(:ok)
    end

    it 'Checks that correct template is being rendered' do
      expect(response).to render_template(:user_details)
    end

    it 'Checks if the response body includes the correct placeholder text' do
      expect(response.body).to include('Users#detail')
    end
  end
end
