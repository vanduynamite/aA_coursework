require 'spec_helper'
require 'rails_helper'

feature 'all goals', type: :feature do

  before :each do
    create :user
    log_in!(User.last)
    create :goal, user: User.last
    title = goal.title
  end

  scenario 'list a users goals' do
    visit user_goals_url(User.last.id)
    expect(page).to have_content(title)
  end

  scenario 'has new goal form if user is logged in' do
    visit user_goals_url(User.last.id)
    expect(page).to have_content("New Goal")
  end

end
