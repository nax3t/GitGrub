FactoryGirl.define do
	factory :user do
		provider 'github'
		uid 1234
		name 'Example User'
	end
end