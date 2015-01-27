require "rails_helper"

RSpec.describe SessionsController, type: :routing do
	it 'creates a session' do
		expect(get('/auth/github/callback')).to route_to('sessions#create')
	end

	it 'destroys a session' do
		expect(get('/signout')).to route_to('sessions#destroy')
	end
end