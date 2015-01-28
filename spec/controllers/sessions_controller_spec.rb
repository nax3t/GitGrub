require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
	describe '#create' do
		let!(:user) { FactoryGirl.create(:user) }

		context 'valid params' do
			before do
				request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:github] 
				post :create, user: {
					uid: '1234', provider: 'github'
				}
			end

			it 'creates a new session' do 
				expect(session[:user_id]).to_not be_nil
				# expect(assigns(:user_id)).to eq user.id
			end

			it 'redirects to root' do
				expect(response).to redirect_to root_path
			end
		end
	end

	describe '#destroy' do 
		before { delete :destroy }

		it 'logs out a current user' do 
			expect(session[:user_id]).to eq nil
		end

		it 'returns 200' do
			expect(response).to redirect_to root_path
		end
	end
end
