require "rails_helper"

RSpec.describe UsersController, type: :routing do
	it 'routes to #new' do
		expect(get('/users/new')).to route_to('users#new')
	end

	it 'roots to #new' do
		expect(get('/')).to route_to('users#new')
	end
end