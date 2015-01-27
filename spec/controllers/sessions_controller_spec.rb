require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
	describe '#create' do 
		# it 'creates a new session' do 
		# 	expect(assigns(:user_id)).to eq user.id 
		# end

		it 'returns 200' do 
			expect(response).to be_success
		end
	end

	describe '#destroy' do 
		it 'logs out a current user' do 
			expect(assigns(:user_id)).to eq nil
		end

		it 'returns 200' do 
			expect(response).to be_success
		end
	end
end
