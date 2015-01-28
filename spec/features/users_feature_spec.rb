require 'rails_helper'

# Tests will only pass when environments have omniauth test mode set to true
=begin
feature 'User sign up', type: :feature do
  scenario 'signing up a new user' do
    visit '/'
    click_link('Sign up with GitHub')

    expect(page).to have_content 'success'
  end

  scenario 'signing out a current user' do
    visit '/'
    click_link('Sign up with GitHub')
    click_link('Sign out')

    expect(page).to have_content 'success'
  end
=end
