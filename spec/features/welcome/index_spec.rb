require 'rails_helper'

describe 'welcome index' do
  before :each do
    @user_1 = User.create!(name: 'JoJo', email: 'JoJo@hotmail.com')
    @user_2 = User.create!(name: 'JaJa', email: 'JaJa@hotmail.com')
    visit '/'
  end

  it 'has application title' do
    expect(page).to have_content('Viewing Party')
  end

  it 'has button to create new user' do
    expect(page).to have_button('Create New User')
  end

  it 'has list of existing users' do
    expect(page).to have_content('Users')
    within '#users' do
      expect(page).to have_link(@user_1.name)
      expect(page).to have_link(@user_2.name)
    end
  end

  it 'has link to go back to home page' do
    within '#nav-container' do
      expect(page).to have_link('Home')
    end
  end
end
