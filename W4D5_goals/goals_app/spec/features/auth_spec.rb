require 'spec_helper'
require 'rails_helper'

feature 'the signup process', type: :feature do

  scenario 'has a new user page' do
    visit new_user_url
    expect(page).to have_content('New User')
    expect(page).to have_content('Username')
    expect(page).to have_content('Password')
  end

  feature 'signing up a user' do
    scenario 'shows username on the homepage after signup' do
      create :user
      log_in_user(User.last)
      visit user_goals_url(User.last)
      expect(page).to have_content(user.username)
    end
  end
end


feature 'logging in' do
  scenario 'shows username on the homepage after login' do
    create :user
    log_in_user(User.last)
    visit user_goals_url(User.last)
    expect(page).to have_content(user.username)
  end

end

feature 'logging out' do

  scenario 'begins with a logged out state' do
    create :user
    visit user_goals_url(User.last)
    expect(page).to have_content("Log in")
  end

  # let(:user) { create :user }
  scenario 'doesn\'t show username on the homepage after logout' do
    create :user
    log_in_user(User.last)
    log_out!(User.last)
    expect(page).to_not have_content(User.last.username)
  end

end
