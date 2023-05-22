# frozen_string_literal: true

require 'rails_helper'

describe 'welcome index' do
  before :each do
    @user1 = User.create!(name: 'JoJo', email: 'JoJo@hotmail.com', password: 'Password123', password_confirmation: 'Password123')
    @user2 = User.create!(name: 'JaJa', email: 'JaJa@hotmail.com', password: 'Password123', password_confirmation: 'Password123')
    visit '/'
  end

  it 'has application title' do
    expect(page).to have_content('Viewing Party')
  end

  it 'has button to create new user' do
    expect(page).to have_button('Create New User')
    click_button 'Create New User'
    expect(current_path).to eq(new_user_path)
  end

  it 'has list of existing users' do
    expect(page).to have_content('Users')
    within '#users' do
      expect(page).to have_link(@user1.name)
      expect(page).to have_link(@user2.name)
    end
  end

  it 'has link to go back to home page' do
    within '#nav-container' do
      expect(page).to have_link('Home')
      click_link 'Home'
      expect(current_path).to eq('/')
    end
  end

  it 'has login link' do
    expect(page).to have_link("Log In")
  end
end
