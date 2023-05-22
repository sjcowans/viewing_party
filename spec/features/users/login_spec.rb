require 'rails_helper'

describe 'login user' do
  before :each do
    @user1 = User.create!(name: 'JoJo', email: 'JoJo@hotmail.com', password: 'Password123', password_confirmation: 'Password123')
    @user2 = User.create!(name: 'JaJa', email: 'JaJa@hotmail.com', password: 'Password123', password_confirmation: 'Password123')
    visit '/'
    click_link "Log In"
  end
  
  it 'can login' do
    fill_in :email, with: "JoJo@hotmail.com"
    fill_in :password, with: "Password123"
    
    click_on "Log In"
    expect(current_path).to eq(user_path(@user1))
    expect(page).to have_content("Welcome, #{@user1.name}!")
  end

  it 'will redirect with error with wrong credentials' do
    fill_in :email, with: "JoJo@hotmail.com"
    fill_in :password, with: "Password124"
    
    click_on "Log In"

    expect(current_path).to eq(login_path)
    expect(page).to have_content("Sorry, your credentials are bad.")
  end
end