require 'rails_helper'

RSpec.describe UsersController, type: :controller do
	describe '#new' do
		before { get :new }

		it 'returns 200' do
			expect(response).to be_success
		end

		it 'renders users/new' do
			expect(response).to render_template 'users/new'
		end

	end
end