require 'rails_helper'
require 'capybara/rails'

feature 'Users creates a post', type: :feature do
  scenario 'creating a post' do 
    visit '/posts/new'

    fill_in 'Place', with: 'Chipotle'
    fill_in 'Neighborhood', with: 'Fidi'
    fill_in 'Time', with: 'Noon'
    fill_in 'Body', with: 'Join me!'

    click_button 'Save'

    expect(page).to have_content 'Success'
    expect(page).to have_content 'Chipotle'
  end

#   scenario 'showing a post' do 
#     visit "/posts/#{post.id}"

#     expect(page).to have_content post.place 
#     expect(page).to have_content post.neighborhood 
#     expect(page).to have_content post.time 
#     expect(page).to have_content post.body  
#   end

#   scenario 'updating a post' do 
#     visit "/posts/#{post.id}/edit"

#     fill_in 'Place', with: 'SECRET_PLACE'
#     fill_in 'Neighborhood', with: 'SECRET_NEIGHBORHOOD'
#     fill_in 'Time', with: 'SECRET_TIME'
#     fill_in 'Body', with: 'SECRET_BODY'

#     click_button 'Save'

#     expect(page).to have_content 'SECRET_PLACE'
#     expect(page).not_to have_content post.place 
#   end

#   scenario 'deleting a post' do
#     visit "/posts/#{post.id}"

#     click_link 'Delete'

#     expect {
#       visit "/posts/#{post.id}"
#     }.to raise_error ActiveRecord::RecordNotFound
#   end
end