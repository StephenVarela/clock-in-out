require 'rails_helper'
require 'byebug'

RSpec.describe UsersController, type: :request do           
  describe 'GET /index' do
    let!(:user) { FactoryBot.create(:user) }
    let!(:time_cards) { FactoryBot.create_list(:time_card, 10, user: user) }
    
    context 'logged out' do
      it 'redirects to home' do 
        get users_path
        expect(response).to have_http_status(302)
      end
    end
    
    context 'logged in' do
      before do 
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      end
      
      it 'responds with status 200' do 
        get users_path
        expect(response).to have_http_status(200)
      end
    end
  end
end