# require 'rails_helper'
# feature 'User comments on post', type: :feature do
# 	given(:post) { FactoryGirl.create(:post) }


# 	scenario 'create comment on existing post' do
# 		visit "/posts/#{post.id}"

# 		fill_in 'commentBody', with: 'I will be there!'

# 		click_button 'Save'

# 		expect(page).to have_content 'You have successfully added a comment!'
# 		expect(page).to have_content 'I will be there!'
# 	end


# end